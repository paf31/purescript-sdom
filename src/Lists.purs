module Lists
  ( StaticDOM
  , element
  , element_
  , array
  , text
  , runStaticDOM
  ) where

import Prelude

import Control.Alternative (empty, (<|>))
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Control.Monad.Eff.Ref (REF, newRef, readRef, writeRef)
import Control.Monad.Rec.Class (Step(..), tailRecM)
import DOM (DOM)
import DOM.Event.Event as Event
import DOM.Event.EventTarget (addEventListener, eventListener)
import DOM.HTML (window)
import DOM.HTML.HTMLInputElement (setValue)
import DOM.HTML.Types (htmlDocumentToDocument)
import DOM.HTML.Window (document)
import DOM.Node.Document (createDocumentFragment, createElement, createTextNode)
import DOM.Node.Element (setAttribute)
import DOM.Node.Node (appendChild, lastChild, removeChild, setTextContent)
import DOM.Node.Types (Element, Node, documentFragmentToNode, elementToEventTarget, elementToNode, textToNode)
import Data.Array (length, modifyAt, unsafeIndex, zipWith, (!!), (..))
import Data.Filterable (filterMap)
import Data.Foldable (for_, oneOf)
import Data.FoldableWithIndex (traverseWithIndex_)
import Data.Lens (over)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Newtype (wrap)
import Data.Profunctor (class Profunctor, dimap)
import Data.Profunctor.Strong (class Strong, first, second)
import Data.StrMap as StrMap
import Data.Traversable (traverse)
import Data.TraversableWithIndex (traverseWithIndex)
import Data.Tuple (Tuple(..), fst, snd)
import FRP (FRP)
import FRP.Event (Event, create, subscribe)
import Partial.Unsafe (unsafePartial)
import Unsafe.Coerce (unsafeCoerce)

newtype StaticDOM eff i o = StaticDOM
  (Node
  -> i
  -> Event { old :: i, new :: i }
  -> Eff eff (Event (i -> o)))

instance functorStaticDOM :: Functor (StaticDOM eff i) where
  map f (StaticDOM sd) = StaticDOM \n a e ->
    map (map f) <$> sd n a e

instance profunctorStaticDOM :: Profunctor (StaticDOM eff) where
  dimap f g (StaticDOM sd) = StaticDOM \n a e ->
    map (dimap f g)  <$> sd n (f a) (map (\{old, new} -> { old: f old, new: f new }) e)

instance strongStaticDOM :: Strong (StaticDOM eff) where
  first (StaticDOM sd) = StaticDOM \n (Tuple a _) e ->
    map first <$> sd n a (map (\{old, new} -> { old: fst old, new: fst new }) e)
  second (StaticDOM sd) = StaticDOM \n (Tuple _ b) e ->
    map second <$> sd n b (map (\{old, new} -> { old: snd old, new: snd new }) e)

unStaticDOM
  :: forall eff i o
   . StaticDOM eff i o
  -> Node
  -> i
  -> Event { old :: i, new :: i }
  -> Eff eff (Event (i -> o))
unStaticDOM (StaticDOM f) = f

text :: forall eff i o. (i -> String) -> StaticDOM (dom :: DOM, frp :: FRP, console :: CONSOLE | eff) i o
text f = StaticDOM \n model e -> do
  doc <- window >>= document
  tn <- createTextNode (f model) (htmlDocumentToDocument doc)
  _ <- appendChild (textToNode tn) n
  _ <- e `subscribe` \{old, new} -> do
    let oldValue = f old
        newValue = f new
    when (oldValue /= newValue) do
      log $ "set text content to " <> show newValue
      setTextContent newValue (textToNode tn)
  pure empty

element_
  :: forall eff i o
   . String
  -> Array (StaticDOM (console :: CONSOLE, dom :: DOM, frp :: FRP | eff) i o)
  -> StaticDOM (console :: CONSOLE, dom :: DOM, frp :: FRP | eff) i o
element_ el = element el StrMap.empty StrMap.empty

element
  :: forall eff i o
   . String
  -> StrMap.StrMap (i -> String)
  -> StrMap.StrMap (Event.Event -> i -> o)
  -> Array (StaticDOM (console :: CONSOLE, dom :: DOM, frp :: FRP | eff) i o)
  -> StaticDOM (console :: CONSOLE, dom :: DOM, frp :: FRP | eff) i o
element el attrs handlers children = StaticDOM \n model updates -> do
  doc <- window >>= document
  e <- createElement el (htmlDocumentToDocument doc)
  _ <- appendChild (elementToNode e) n
  let setAttr
        :: String
        -> (i -> String)
        -> Eff (console :: CONSOLE, dom :: DOM, frp :: FRP | eff) Unit
      setAttr attrName f = do
        setAttribute attrName (f model) e
        _ <- updates `subscribe` \{old, new} -> do
              let oldValue = f old
                  newValue = f new
              when (oldValue /= newValue) do
                log $ "set attribute " <> show attrName <> " to " <> show newValue
                case attrName of
                  "value" -> setValue newValue (unsafeCoerce e)
                  _ -> setAttribute attrName newValue e
        pure unit

      setHandler
        :: String
        -> (Event.Event -> i -> o)
        -> Eff (console :: CONSOLE, dom :: DOM, frp :: FRP | eff) (Event (i -> o))
      setHandler evtName f = do
        {event, push} <- create
        addEventListener (wrap evtName) (eventListener (push <<< f)) false (elementToEventTarget e)
        pure event
  traverseWithIndex_ setAttr attrs
  evts <- traverseWithIndex setHandler handlers
  childrenEvts <- traverse (\child -> unStaticDOM child (elementToNode e) model updates) children
  pure (oneOf evts <|> oneOf childrenEvts)

removeLastNChildren :: forall eff. Int -> Node -> Eff (dom :: DOM | eff) Unit
removeLastNChildren m n = tailRecM loop m where
  loop toRemove
    | toRemove <= 0 = pure (Done unit)
    | otherwise = do
    child <- lastChild n
    case child of
      Nothing -> pure (Done unit)
      Just child_ -> do _ <- removeChild child_ n
                        pure (Loop (toRemove - 1))

array
  :: forall eff i
   . String
  -> StaticDOM (console :: CONSOLE, dom :: DOM, frp :: FRP | eff) i i
  -> StaticDOM (console :: CONSOLE, dom :: DOM, frp :: FRP | eff) (Array i) (Array i)
array el sd = StaticDOM \n models updates -> do
  doc <- window >>= document
  e <- createElement el (htmlDocumentToDocument doc)
  _ <- appendChild (elementToNode e) n
  {event, push} <- create
  let setup :: Array i -> Array i -> Eff _ Unit
      setup old new
        | length new > length old = do
          for_ (length old .. (length new - 1)) \idx -> do
            fragment <- createDocumentFragment (htmlDocumentToDocument doc)
            let frag = documentFragmentToNode fragment
                here xs = unsafePartial (xs `unsafeIndex` idx)
            childEvts <- unStaticDOM sd frag (here new) (filterMap (\{old, new} -> { old: _, new: _ } <$> (old !! idx) <*> (new !! idx)) updates)
            _ <- childEvts `subscribe` \f -> push (fromMaybe <*> modifyAt idx f)
            _ <- appendChild frag (elementToNode e)
            pure unit
        | length new < length old = do
          removeLastNChildren (length old - length new) (elementToNode e)
        | otherwise = pure unit -- nothing to do
  _ <- setup [] models
  _ <- updates `subscribe` \{old, new} -> setup old new
  pure event

runStaticDOM
  :: forall model eff
   . Element
  -> model
  -> (forall eff1. StaticDOM (console :: CONSOLE, dom :: DOM, frp :: FRP, ref :: REF | eff1) model model)
  -> Eff (console :: CONSOLE, frp :: FRP, dom :: DOM, ref :: REF | eff) Unit
runStaticDOM root model v = do
  modelRef <- newRef model
  document <- window >>= document
  { event, push } <- create
  fragment <- createDocumentFragment (htmlDocumentToDocument document)
  let n = documentFragmentToNode fragment
  updates <- unStaticDOM v n model event
  _ <- updates `subscribe` \f -> do
    oldModel <- readRef modelRef
    let newModel = f oldModel
    _ <- writeRef modelRef newModel
    push { old: oldModel, new: newModel }
  _ <- appendChild n (elementToNode root)
  pure unit
