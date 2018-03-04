module StaticDOM
  ( StaticDOM
  , Attr(..)
  , element
  , element_
  , ArrayChannel(..)
  , ArrayContext
  , array
  , text
  , runStaticDOM
  ) where

import Prelude

import Control.Alternative (empty, (<|>))
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Ref (REF, newRef, readRef, writeRef)
import Control.Monad.Rec.Class (Step(..), tailRecM)
import DOM (DOM)
import DOM.Event.Event as Event
import DOM.Event.EventTarget (addEventListener, eventListener, removeEventListener)
import DOM.HTML (window)
import DOM.HTML.HTMLInputElement (setChecked, setDisabled, setValue)
import DOM.HTML.Types (htmlDocumentToDocument)
import DOM.HTML.Window (document)
import DOM.Node.Document (createDocumentFragment, createElement, createTextNode)
import DOM.Node.Element (removeAttribute, setAttribute)
import DOM.Node.Node (appendChild, lastChild, removeChild, setTextContent)
import DOM.Node.Types (Element, Node, documentFragmentToNode, elementToEventTarget, elementToNode, textToNode)
import Data.Array (length, modifyAt, unsafeIndex, (!!), (..))
import Data.Either (Either(..), either)
import Data.Filterable (filterMap)
import Data.Foldable (for_, oneOfMap, sequence_, traverse_)
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

newtype StaticDOM ch ctx i o = StaticDOM
  (forall eff
   . Node
  -> ctx
  -> i
  -> Event { old :: i, new :: i }
  -> Eff (dom :: DOM, frp :: FRP | eff)
       { events :: Event (Either ch (i -> o))
       , unsubscribe :: Eff (dom :: DOM, frp :: FRP | eff) Unit
       })

instance functorStaticDOM :: Functor (StaticDOM ch ctx i) where
  map f (StaticDOM sd) = StaticDOM \n ctx a e ->
    overEvents (map (map (map f))) <$> sd n ctx a e

instance profunctorStaticDOM :: Profunctor (StaticDOM ch ctx) where
  dimap f g (StaticDOM sd) = StaticDOM \n ctx a e ->
    overEvents (map (map (dimap f g))) <$> sd n ctx (f a) (map (\{ old, new } -> { old: f old, new: f new }) e)

instance strongStaticDOM :: Strong (StaticDOM ch ctx) where
  first (StaticDOM sd) = StaticDOM \n ctx (Tuple a _) e ->
    overEvents (map (map first)) <$> sd n ctx a (map (\{ old, new } -> { old: fst old, new: fst new }) e)
  second (StaticDOM sd) = StaticDOM \n ctx (Tuple _ b) e ->
    overEvents (map (map second)) <$> sd n ctx b (map (\{ old, new } -> { old: snd old, new: snd new }) e)

overEvents
  :: forall a b r
   . (a -> b)
  -> { events :: a | r }
  -> { events :: b | r }
overEvents f o = o { events = f o.events }

unStaticDOM
  :: forall eff ch ctx i o
   . StaticDOM ch ctx i o
  -> Node
  -> ctx
  -> i
  -> Event { old :: i, new :: i }
  -> Eff (dom :: DOM, frp :: FRP | eff)
       { events :: Event (Either ch (i -> o))
       , unsubscribe :: Eff (dom :: DOM, frp :: FRP | eff) Unit
       }
unStaticDOM (StaticDOM f) = f

text :: forall ch ctx i o. (ctx -> i -> String) -> StaticDOM ch ctx i o
text f = StaticDOM \n ctx model e -> do
  doc <- window >>= document
  tn <- createTextNode (f ctx model) (htmlDocumentToDocument doc)
  _ <- appendChild (textToNode tn) n
  unsubscribe <- e `subscribe` \{ old, new } -> do
    let oldValue = f ctx old
        newValue = f ctx new
    when (oldValue /= newValue) $
      setTextContent newValue (textToNode tn)
  pure { unsubscribe, events: empty }

data Attr
  = StringAttr String
  | BooleanAttr Boolean

derive instance eqAttr :: Eq Attr

element_
  :: forall ch ctx i o
   . String
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
element_ el = element el StrMap.empty StrMap.empty

element
  :: forall ch ctx i o
   . String
  -> StrMap.StrMap (ctx -> i -> Attr)
  -> StrMap.StrMap (ctx -> Event.Event -> Either ch (i -> o))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
element el attrs handlers children = StaticDOM \n ctx model updates -> do
  doc <- window >>= document
  e <- createElement el (htmlDocumentToDocument doc)
  _ <- appendChild (elementToNode e) n
  let setAttr
        :: forall eff
         . String
        -> (ctx -> i -> Attr)
        -> Eff (frp :: FRP, dom :: DOM | eff)
             (Eff (frp :: FRP, dom :: DOM | eff) Unit)
      setAttr attrName f = do
        let go = case _ of
                   StringAttr s -> do
                     case attrName of
                       "value" -> setValue s (unsafeCoerce e)
                       _ -> pure unit
                     setAttribute attrName s e
                   BooleanAttr b -> do
                     case attrName of
                       "checked" -> setChecked b (unsafeCoerce e)
                       "disabled" -> setDisabled b (unsafeCoerce e)
                       _ -> pure unit
                     if b then setAttribute attrName attrName e
                          else removeAttribute attrName e
        go (f ctx model)
        updates `subscribe` \{ old, new } -> do
          let oldValue = f ctx old
              newValue = f ctx new
          when (oldValue /= newValue) $
            go newValue

      setHandler
        :: forall eff
         . String
        -> (ctx -> Event.Event -> Either ch (i -> o))
        -> Eff (frp :: FRP, dom :: DOM | eff)
             { events :: Event (Either ch (i -> o))
             , unsubscribe :: Eff (frp :: FRP, dom :: DOM | eff) Unit
             }
      setHandler evtName f = do
        { event, push } <- create
        let listener = eventListener (push <<< f ctx)
            target = elementToEventTarget e
            unsubscribe = removeEventListener (wrap evtName) listener false target
        addEventListener (wrap evtName) listener false target
        pure
          { events: event
          , unsubscribe
          }
  unsubcribers <- traverseWithIndex setAttr attrs
  evts <- traverseWithIndex setHandler handlers
  childrenEvts <- traverse (\child -> unStaticDOM child (elementToNode e) ctx model updates) children
  pure
    { events:
        oneOfMap _.events evts
        <|> oneOfMap _.events childrenEvts
    , unsubscribe:
        sequence_ unsubcribers
          *> traverse_ _.unsubscribe evts
          *> traverse_ _.unsubscribe childrenEvts
    }

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

data ArrayChannel i channel
  = Parent channel
  | Here (Array i -> Array i)

type ArrayContext ctx =
  { index :: Int
  , parent :: ctx
  }

array
  :: forall ch ctx i
   . String
  -> StaticDOM (ArrayChannel i ch) (ArrayContext ctx) i i
  -> StaticDOM ch ctx (Array i) (Array i)
array el sd = StaticDOM arrayImpl where
  arrayImpl
    :: forall eff
     . Node
    -> ctx
    -> Array i
    -> Event { old :: Array i, new :: Array i }
    -> Eff (dom :: DOM, frp :: FRP | eff)
         { events :: Event (Either ch (Array i -> Array i))
         , unsubscribe :: Eff (dom :: DOM, frp :: FRP | eff) Unit
         }
  arrayImpl n ctx models updates = do
    doc <- window >>= document
    e <- createElement el (htmlDocumentToDocument doc)
    _ <- appendChild (elementToNode e) n
    { event, push } <- create
    let setup :: Array i -> Array i -> Eff (frp :: FRP, dom :: DOM | eff) Unit
        setup old_ new_
          | length new_ > length old_ = do
            for_ (length old_ .. (length new_ - 1)) \idx -> do
              fragment <- createDocumentFragment (htmlDocumentToDocument doc)
              let frag = documentFragmentToNode fragment
                  here xs = unsafePartial (xs `unsafeIndex` idx)
                  childCtx = { index: idx, parent: ctx }
              { events, unsubscribe } <- unStaticDOM sd frag childCtx (here new_) (filterMap (\{ old, new } -> { old: _, new: _ } <$> (old !! idx) <*> (new !! idx)) updates)
              unsubscribe1 <- events `subscribe` \ev ->
                case ev of
                  Left (Parent other) -> push (Left other)
                  Left (Here fi) -> push (Right fi)
                  Right f -> push (Right (\xs -> fromMaybe xs (modifyAt idx f xs)))
              _ <- appendChild frag (elementToNode e)
              -- TODO: store the unsubcribers for the new child
              pure unit
          | length new_ < length old_ = do
            -- TODO: run the unsubcribers for the removed elements
            removeLastNChildren (length old_ - length new_) (elementToNode e)
          | otherwise = pure unit
    setup [] models
    unsubscribe <- updates `subscribe` \{ old, new } -> setup old new
    pure
      { events: event
      , unsubscribe -- TODO: run any remaining unsubscribers
      }

runStaticDOM
  :: forall eff model
   . Element
  -> model
  -> StaticDOM Void Unit model model
  -> Eff (dom :: DOM, frp :: FRP, ref :: REF | eff)
       (Eff (dom :: DOM, frp :: FRP, ref :: REF | eff) Unit)
runStaticDOM root model v = do
  modelRef <- newRef model
  document <- window >>= document
  { event, push } <- create
  fragment <- createDocumentFragment (htmlDocumentToDocument document)
  let n = documentFragmentToNode fragment
  { events, unsubscribe } <- unStaticDOM v n unit model event
  unsubscribe1 <- events `subscribe` \e -> do
    oldModel <- readRef modelRef
    let f = either absurd id e
        newModel = f oldModel
    _ <- writeRef modelRef newModel
    push { old: oldModel, new: newModel }
  _ <- appendChild n (elementToNode root)
  pure (unsubscribe *> unsubscribe1)
