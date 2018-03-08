module SDOM
  ( SDOM
  , mapContext
  , text
  , Attr
  , unsafeAttr
  , Handler
  , handler
  , element
  , element_
  , ArrayChannel(..)
  , ArrayContext
  , array
  , attach
  ) where

import Prelude

import Control.Alternative (empty, (<|>))
import Control.Lazy (class Lazy)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Ref (REF, modifyRef, modifyRef', newRef, readRef, writeRef)
import Control.Monad.Rec.Class (Step(..), tailRecM)
import DOM (DOM)
import DOM.Event.Event as Event
import DOM.Event.EventTarget (addEventListener, eventListener, removeEventListener)
import DOM.HTML (window)
import DOM.HTML.Types (htmlDocumentToDocument)
import DOM.HTML.Window (document)
import DOM.Node.Document (createDocumentFragment, createElement, createTextNode)
import DOM.Node.Node (appendChild, lastChild, removeChild, setTextContent)
import DOM.Node.Types (Element, Node, documentFragmentToNode, elementToEventTarget, elementToNode, textToNode)
import Data.Array (length, modifyAt, unsafeIndex, (!!), (..))
import Data.Either (Either(..), either)
import Data.Filterable (filterMap)
import Data.Foldable (for_, oneOfMap, sequence_, traverse_)
import Data.List (List(..), drop, take, (:))
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Newtype (wrap)
import Data.Profunctor (class Profunctor, dimap)
import Data.Profunctor.Strong (class Strong, first, second)
import Data.Traversable (traverse)
import Data.Tuple (Tuple(..), fst, snd)
import FRP (FRP)
import FRP.Event (Event, create, subscribe)
import Partial.Unsafe (unsafePartial)

-- | A value of type `SDOM channel context i o` represents a component in the
-- | "static DOM".
-- |
-- | Simple components can be created using the `text` and `element` functions.
-- | The `array` function can be used to create a component which renders a
-- | uniform array of subcomponents. The `SDOM.Components` module also contains
-- | some ready-to-use components.
-- |
-- | Here is an explanation of each type variable:
-- |
-- | - `i` is the type of the model (when used as an input).
-- |   Inputs of type `i` will be provided in order to initialize or rerender
-- |   the component.
-- | - `o` is the type of the model (when used as an output).
-- |   Events raised by the component may change the model by providing a function
-- |   of type `i -> o`. The model is split into input and output type arguments
-- |   to allow the profunctor instances for `SDOM` to exist, and to enable the
-- |   use of profunctor lenses for component composition.
-- | - `context` is the type of the "context" of the component. If the component
-- |   is rendered as a child of a dynamically-sized list, the context will include
-- |   its index in that list, for example. This type argument may not be needed
-- |   in simple components.
-- | - `channel` is the type of the "event channel" of the component. If the
-- |   component is rendered as a child of a dynamically-sized list, the channel
-- |   type will provide a way to pass an event to the owner of that list, so that
-- |   the component can modify the list itself, not just the element of the list
-- |   which generated it. For example, we might use the channel to allow a
-- |   component to remove itself from a list.
-- |
-- | Since `SDOM` is a _strong profunctor_, we can apply profunctor lenses to values
-- | of type `SDOM channel context i o` directly, to focus a component on a
-- | particular piece of the model:
-- |
-- | ```
-- | > :type text (const id)
-- | forall channel context a. SDOM channel context String a
-- |
-- | > import Data.Lens
-- | > :type _1 (text (const id))
-- | forall channel context a b.
-- |   SDOM channel context
-- |     (Tuple String b)
-- |     (Tuple a b)
-- | ```
newtype SDOM channel context i o = SDOM
  (forall eff
   . Node
  -> context
  -> i
  -> Event { old :: i, new :: i }
  -> Eff (dom :: DOM, frp :: FRP, ref :: REF | eff)
       { events :: Event (Either channel (i -> o))
       , unsubscribe :: Eff (dom :: DOM, frp :: FRP, ref :: REF | eff) Unit
       })

-- | Change the context type of a component.
mapContext
  :: forall channel context context' i o
   . (context' -> context)
  -> SDOM channel context i o
  -> SDOM channel context' i o
mapContext f (SDOM sd) = SDOM \n ctx -> sd n (f ctx)

instance functorSDOM :: Functor (SDOM channel context i) where
  map f (SDOM sd) = SDOM \n context a e ->
    overEvents (map (map (map f))) <$> sd n context a e

instance profunctorSDOM :: Profunctor (SDOM channel context) where
  dimap f g (SDOM sd) = SDOM \n context a e ->
    overEvents (map (map (dimap f g))) <$> sd n context (f a) (map (\{ old, new } -> { old: f old, new: f new }) e)

instance strongSDOM :: Strong (SDOM channel context) where
  first (SDOM sd) = SDOM \n context (Tuple a _) e ->
    overEvents (map (map first)) <$> sd n context a (map (\{ old, new } -> { old: fst old, new: fst new }) e)
  second (SDOM sd) = SDOM \n context (Tuple _ b) e ->
    overEvents (map (map second)) <$> sd n context b (map (\{ old, new } -> { old: snd old, new: snd new }) e)

instance lazySDOM :: Lazy (SDOM channel context i o) where
  defer f = SDOM \n -> unSDOM (f unit) n

overEvents
  :: forall a b r
   . (a -> b)
  -> { events :: a | r }
  -> { events :: b | r }
overEvents f o = o { events = f o.events }

unSDOM
  :: forall eff channel context i o
   . SDOM channel context i o
  -> Node
  -> context
  -> i
  -> Event { old :: i, new :: i }
  -> Eff (dom :: DOM, frp :: FRP, ref :: REF | eff)
       { events :: Event (Either channel (i -> o))
       , unsubscribe :: Eff (dom :: DOM, frp :: FRP, ref :: REF | eff) Unit
       }
unSDOM (SDOM f) = f

-- | Create a component which renders a text node based on some part of the
-- | input model.
-- |
-- | The first argument is a function which chooses a `String` to render from
-- | the model. The function also has access to the context of the component.
-- |
-- | For example:
-- |
-- | ```
-- | > :type text \_ctx model -> model.title
-- | forall channel context a r.
-- |   SDOM channel context
-- |     { title :: String
-- |     | r
-- |     }
-- |     a
-- | ```
text :: forall channel context i o. (context -> i -> String) -> SDOM channel context i o
text f = SDOM \n context model e -> do
  doc <- window >>= document
  tn <- createTextNode (f context model) (htmlDocumentToDocument doc)
  _ <- appendChild (textToNode tn) n
  unsubscribe <- e `subscribe` \{ old, new } -> do
    let oldValue = f context old
        newValue = f context new
    when (oldValue /= newValue) $
      setTextContent newValue (textToNode tn)
  pure { unsubscribe, events: empty }

-- | An attribute which can be associated with an `element`.
-- |
-- | The type arguments correspond to the context and model types of the resulting
-- | component.
-- |
-- | Attributes can be constructed using the functions in the `SDOM.Attributes`
-- | module, or unsafely using the `unsafeAttr` function.
-- |
-- | For example:
-- |
-- | ```
-- | > import SDOM.Attributes as A
-- | > :type A.type_ \_ model -> model.type
-- | forall context r.
-- |   Attr context
-- |     { "type" :: String
-- |     | r
-- |     }
-- | ```
newtype Attr context model = Attr
   ( forall eff
   . context
  -> Element
  -> { init :: model -> Eff (dom :: DOM | eff) Unit
     , update :: { old :: model, new :: model } -> Eff (dom :: DOM | eff) Unit
     }
   )

-- | Create an attribute unsafely, by providing functions which initialize
-- | and update the attribute.
-- |
-- | _Note_: most applications should not require this function. Consider using
-- | the functions in the `SDOM.Attributes` module instead.
unsafeAttr
  :: forall context model
   . ( forall eff
     . context
    -> Element
    -> { init :: model -> Eff (dom :: DOM | eff) Unit
       , update :: { old :: model
                   , new :: model
                   }
                -> Eff (dom :: DOM | eff) Unit
       }
     )
  -> Attr context model
unsafeAttr = Attr

-- | An event handler which can be associated with an `element`.
-- |
-- | The `context` type argument corresponds to the context type of the resulting
-- | component. The `e` type argument represents the type of event which will be
-- | handled. This might take into account the _event channel_ of the component.
-- |
-- | Event handlers can be constructed using the functions in the `SDOM.Events`
-- | module, or by using the `handler` function.
-- |
-- | For example:
-- |
-- | ```
-- | > import SDOM.Events as Events
-- | > :type Events.click \_ _ -> unit
-- | forall context. Handler context Unit
-- | ```
newtype Handler context e = Handler
  (forall eff
   . context
  -> Element
  -> Eff (frp :: FRP, dom :: DOM | eff)
       { events :: Event e
       , unsubscribe :: Eff (frp :: FRP, dom :: DOM | eff) Unit
       }
  )

-- | Create a `Handler` for specific events.
-- |
-- | The first argument is the name of the type of events to handle.
-- |
-- | The second argument is a function which produces a result from the raw DOM
-- | event object. The function also has access to the context of the component.
handler
  :: forall context e
   . String
  -> (context -> Event.Event -> e)
  -> Handler context e
handler evtName f = Handler \context e -> do
  { event, push } <- create
  let listener = eventListener (push <<< f context)
      target = elementToEventTarget e
      unsubscribe = removeEventListener (wrap evtName) listener false target
  addEventListener (wrap evtName) listener false target
  pure
    { events: event
    , unsubscribe
    }

-- | Create a component which renders an element, including attributes, event
-- | handlers and a (static) list of child components.
-- |
-- | Instead of using this function directly, you probably will want to use the
-- | helper functions in the `SDOM.Elements` module.
-- |
-- | The first argument is the name of the element.
-- |
-- | The second argument is an array of attributes to attach to the rendered element.
-- |
-- | The third argument is an array of event handlers. Note that the result types
-- | of each handler is `Either channel (i -> o)`. That is, an event can _either_
-- | update the state of the current component (by providing a function of type
-- | `i -> o`), or it can use the _event channel_ to pass a message to a parent
-- | component.
-- |
-- | The fourth argument is a (static) array of child components.
-- |
-- | For example:
-- |
-- | ```
-- | > import SDOM.Elements as E
-- | > :type E.div [] [] [ text \_ _ -> "Hello, World!"]
-- | forall context channel i o.
-- |   SDOM context channel i o
-- |
-- | > import SDOM.Attributes as A
-- | > :type E.input [ A.value \_ model -> model.value ] [] []
-- | forall context channel o r.
-- |   SDOM context channel
-- |     { value :: String
-- |     | r
-- |     }
-- |     o
-- |
-- | > import SDOM.Events as Events
-- | > import Unsafe.Coerce (unsafeCoerce)
-- | > :paste
-- | > :type E.input
-- |     [ value \_ model -> model.value ]
-- |     [ change \_ e -> pure \model ->
-- |         model { value = (unsafeCoerce e).target.value }
-- |     ]
-- |     []
-- | ^D
-- | forall context channel o r.
-- |   SDOM context channel
-- |     { value :: String
-- |     | r
-- |     }
-- |     { value :: String
-- |     | r
-- |     }
-- | ```
element
  :: forall channel context i o
   . String
  -> Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
element el attrs handlers children = SDOM \n context model updates -> do
  doc <- window >>= document
  e <- createElement el (htmlDocumentToDocument doc)
  _ <- appendChild (elementToNode e) n
  let setAttr
        :: forall eff
         . Attr context i
        -> Eff (frp :: FRP, dom :: DOM, ref :: REF | eff)
             (Eff (frp :: FRP, dom :: DOM, ref :: REF | eff) Unit)
      setAttr (Attr attr) = do
        let { init, update } = attr context e
        init model
        updates `subscribe` update

      setHandler
        :: forall eff
         . Handler context (Either channel (i -> o))
        -> Eff (frp :: FRP, dom :: DOM | eff)
             { events :: Event (Either channel (i -> o))
             , unsubscribe :: Eff (frp :: FRP, dom :: DOM | eff) Unit
             }
      setHandler (Handler h) = h context e
  unsubcribers <- traverse setAttr attrs
  evts <- traverse setHandler handlers
  childrenEvts <- traverse (\child -> unSDOM child (elementToNode e) context model updates) children
  pure
    { events:
        oneOfMap _.events evts
        <|> oneOfMap _.events childrenEvts
    , unsubscribe:
        sequence_ unsubcribers
          *> traverse_ _.unsubscribe evts
          *> traverse_ _.unsubscribe childrenEvts
    }

-- | Create a component which renders an element with a (static) array of child
-- | components, but no attributes or event handlers.
-- |
-- | Instead of using this function directly, you probably will want to use the
-- | helper functions in the `SDOM.Elements` module.
-- |
-- | For example:
-- |
-- | ```
-- | > import SDOM.Elements as E
-- | > :type E.div_ [ text \_ _ -> "Hello, World!"]
-- | forall context channel i o.
-- |   SDOM context channel i o
-- | ```
element_
  :: forall channel context i o
   . String
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
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

-- | The event channel for an `array` component.
-- |
-- | An event is either passed to the next `Parent` in the chain, or handled
-- | `Here`, by acting on the array itself.
data ArrayChannel i channel
  = Parent channel
  | Here (Array i -> Array i)

-- | The context of subcomponent in an `array` component includes the current
-- | context inherited from the parent, as well as the index of the current
-- | subcomponent.
type ArrayContext context =
  { index :: Int
  , parent :: context
  }

-- | Create a component which renders an array of subcomponents.
-- |
-- | The first argument is the name of the HTML element used as the container.
-- |
-- | The second argument is a template component for rendered subcomponents.
-- |
-- | _Note:_
-- |
-- | - The context of the template component provides access to the index of
-- |   the current subcomponent.
-- | - The event channel for the template component provides the ability to
-- |   modify the input array itself.
-- | - This component is optimized for edits at the end of the array. Small
-- |   arrays should not present any issues, but large arrays might if edits
-- |   typically take place away from the end of the array.
array
  :: forall channel context i
   . String
  -> SDOM (ArrayChannel i channel) (ArrayContext context) i i
  -> SDOM channel context (Array i) (Array i)
array el sd = SDOM arrayImpl where
  arrayImpl
    :: forall eff
     . Node
    -> context
    -> Array i
    -> Event { old :: Array i, new :: Array i }
    -> Eff (dom :: DOM, frp :: FRP, ref :: REF | eff)
         { events :: Event (Either channel (Array i -> Array i))
         , unsubscribe :: Eff (dom :: DOM, frp :: FRP, ref :: REF | eff) Unit
         }
  arrayImpl n context models updates = do
    doc <- window >>= document
    e <- createElement el (htmlDocumentToDocument doc)
    _ <- appendChild (elementToNode e) n
    unsubscribers <- newRef Nil
    let runUnsubscribers = readRef unsubscribers >>= sequence_
    { event, push } <- create
    let setup :: Array i -> Array i -> Eff (frp :: FRP, dom :: DOM, ref :: REF | eff) Unit
        setup old_ new_
          | length new_ > length old_ = do
            for_ (length old_ .. (length new_ - 1)) \idx -> do
              fragment <- createDocumentFragment (htmlDocumentToDocument doc)
              let frag = documentFragmentToNode fragment
                  here xs = unsafePartial (xs `unsafeIndex` idx)
                  childCtx = { index: idx, parent: context }
              { events, unsubscribe } <- unSDOM sd frag childCtx (here new_) (filterMap (\{ old, new } -> { old: _, new: _ } <$> (old !! idx) <*> (new !! idx)) updates)
              unsubscribe1 <- events `subscribe` \ev ->
                case ev of
                  Left (Parent other) -> push (Left other)
                  Left (Here fi) -> push (Right fi)
                  Right f -> push (Right (\xs -> fromMaybe xs (modifyAt idx f xs)))
              _ <- appendChild frag (elementToNode e)
              modifyRef unsubscribers ((unsubscribe *> unsubscribe1) : _)
              pure unit
          | length new_ < length old_ = do
            let d = length old_ - length new_
            dropped <- modifyRef' unsubscribers \xs -> { state: drop d xs, value: take d xs }
            sequence_ dropped
            removeLastNChildren d (elementToNode e)
          | otherwise = pure unit
    setup [] models
    unsubscribe <- updates `subscribe` \{ old, new } -> setup old new
    pure
      { events: event
      , unsubscribe: unsubscribe *> runUnsubscribers
      }

-- | Attach a component to the DOM.
-- |
-- | The first argument is the DOM `Element` which will contain the rendered
-- | component.
-- |
-- | The second argument is the initial model.
-- |
-- | The third argument is the component itself.
-- |
-- | The result contains two functions:
-- |
-- | - The `push` function allows the caller to provide additional model updates
-- |   which do not arise from user-generated events.
-- | - `The `detach` function detaches the component from the DOM and unregisters
-- |   any event handlers.
attach
  :: forall eff model
   . Element
  -> model
  -> SDOM Void Unit model model
  -> Eff (dom :: DOM, frp :: FRP, ref :: REF | eff)
       { push :: (model -> model) -> Eff (dom :: DOM, frp :: FRP, ref :: REF | eff) Unit
       , detach :: Eff (dom :: DOM, frp :: FRP, ref :: REF | eff) Unit
       }
attach root model v = do
  modelRef <- newRef model
  document <- window >>= document
  { event, push } <- create
  fragment <- createDocumentFragment (htmlDocumentToDocument document)
  let n = documentFragmentToNode fragment
  { events, unsubscribe } <- unSDOM v n unit model event
  let pushNewModel e = do
        oldModel <- readRef modelRef
        let f = either absurd id e
            newModel = f oldModel
        _ <- writeRef modelRef newModel
        push { old: oldModel, new: newModel }
  unsubscribe1 <- events `subscribe` pushNewModel
  _ <- appendChild n (elementToNode root)
  pure
    { push: pushNewModel <<< Right
    , detach: unsubscribe *> unsubscribe1
    }
