module StaticDOM
  ( StaticDOM
  , Attr
  , checked
  , disabled
  , for
  , id_
  , name
  , type_
  , value
  , Handler
  , change
  , click
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
import Data.Traversable (traverse)
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

newtype Attr model = Attr
  (forall eff. Element ->
     { init :: model -> Eff (dom :: DOM | eff) Unit
     , update :: { old :: model, new :: model } -> Eff (dom :: DOM | eff) Unit
     })

attr :: forall model. String -> (model -> String) -> Attr model
attr attrName f =
  Attr \e ->
    { init: \model -> setAttribute attrName (f model) e
    , update: \{ old, new } -> do
        let oldValue = f old
            newValue = f new
        when (oldValue /= newValue) (setAttribute attrName newValue e)
    }

for :: forall model. (model -> String) -> Attr model
for = attr "for"

id_ :: forall model. (model -> String) -> Attr model
id_ = attr "id"

name :: forall model. (model -> String) -> Attr model
name = attr "name"

type_ :: forall model. (model -> String) -> Attr model
type_ = attr "type"

value :: forall model. (model -> String) -> Attr model
value f =
  Attr \e ->
    let update s = do
          setValue s (unsafeCoerce e)
          setAttribute "value" s e
     in { init: \model -> update (f model)
        , update: \{ old, new } -> do
            let oldValue = f old
                newValue = f new
            when (oldValue /= newValue) (update newValue)
        }

checked :: forall model. (model -> Boolean) -> Attr model
checked f =
  Attr \e ->
    let update b = do
          setChecked b (unsafeCoerce e)
          if b then setAttribute "checked" "checked" e
               else removeAttribute "checked" e
     in { init: \model -> update (f model)
        , update: \{ old, new } -> do
            let oldValue = f old
                newValue = f new
            when (oldValue /= newValue) (update newValue)
        }

disabled :: forall model. (model -> Boolean) -> Attr model
disabled f =
  Attr \e ->
    let update b = do
          setDisabled b (unsafeCoerce e)
          if b then setAttribute "disabled" "disabled" e
               else removeAttribute "disabled" e
     in { init: \model -> update (f model)
        , update: \{ old, new } -> do
            let oldValue = f old
                newValue = f new
            when (oldValue /= newValue) (update newValue)
        }

newtype Handler e = Handler
  (forall eff
   . Element
  -> Eff (frp :: FRP, dom :: DOM | eff)
       { events :: Event e
       , unsubscribe :: Eff (frp :: FRP, dom :: DOM | eff) Unit
       }
  )

handler
  :: forall e
   . String
  -> (Event.Event -> e)
  -> Handler e
handler evtName f = Handler \e -> do
  { event, push } <- create
  let listener = eventListener (push <<< f)
      target = elementToEventTarget e
      unsubscribe = removeEventListener (wrap evtName) listener false target
  addEventListener (wrap evtName) listener false target
  pure
    { events: event
    , unsubscribe
    }

change
  :: forall e
   . (Event.Event -> e)
  -> Handler e
change = handler "change"

click
  :: forall e
   . (Event.Event -> e)
  -> Handler e
click = handler "click"

element
  :: forall ch ctx i o
   . String
  -> Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
element el attrs handlers children = StaticDOM \n ctx model updates -> do
  doc <- window >>= document
  e <- createElement el (htmlDocumentToDocument doc)
  _ <- appendChild (elementToNode e) n
  let setAttr
        :: forall eff
         . (ctx -> Attr i)
        -> Eff (frp :: FRP, dom :: DOM | eff)
             (Eff (frp :: FRP, dom :: DOM | eff) Unit)
      setAttr f = do
        let Attr attr = f ctx
            { init, update } = attr e
        init model
        updates `subscribe` update

      setHandler
        :: forall eff
         . (ctx -> Handler (Either ch (i -> o)))
        -> Eff (frp :: FRP, dom :: DOM | eff)
             { events :: Event (Either ch (i -> o))
             , unsubscribe :: Eff (frp :: FRP, dom :: DOM | eff) Unit
             }
      setHandler f = do
        let Handler handler = f ctx
        handler e
  unsubcribers <- traverse setAttr attrs
  evts <- traverse setHandler handlers
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

element_
  :: forall ch ctx i o
   . String
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
element_ el = element el [] []

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
