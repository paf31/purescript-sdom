## Module SDOM

#### `SDOM`

``` purescript
newtype SDOM channel context i o
```

A value of type `SDOM channel context i o` represents a component in the
"static DOM".

Simple components can be created using the `text` and `element` functions.
The `array` function can be used to create a component which renders a
uniform array of subcomponents. The `SDOM.Components` module also contains
some ready-to-use components.

Here is an explanation of each type variable:

- `i` is the type of the model (when used as an input).
  Inputs of type `i` will be provided in order to initialize or rerender
  the component.
- `o` is the type of the model (when used as an output).
  Events raised by the component may change the model by providing a function
  of type `i -> o`. The model is split into input and output type arguments
  to allow the profunctor instances for `SDOM` to exist, and to enable the
  use of profunctor lenses for component composition.
- `context` is the type of the "context" of the component. If the component
  is rendered as a child of a dynamically-sized list, the context will include
  its index in that list, for example. This type argument may not be needed
  in simple components.
- `channel` is the type of the "event channel" of the component. If the
  component is rendered as a child of a dynamically-sized list, the channel
  type will provide a way to pass an event to the owner of that list, so that
  the component can modify the list itself, not just the element of the list
  which generated it. For example, we might use the channel to allow a
  component to remove itself from a list.

Since `SDOM` is a _strong profunctor_, we can apply profunctor lenses to values
of type `SDOM channel context i o` directly, to focus a component on a
particular piece of the model:

```
> :type text (const id)
forall channel context a. SDOM channel context String a

> import Data.Lens
> :type _1 (text (const id))
forall channel context a b.
  SDOM channel context
    (Tuple String b)
    (Tuple a b)
```

##### Instances
``` purescript
Functor (SDOM channel context i)
Profunctor (SDOM channel context)
Strong (SDOM channel context)
Lazy (SDOM channel context i o)
```

#### `text`

``` purescript
text :: forall channel context i o. (context -> i -> String) -> SDOM channel context i o
```

Create a component which renders a text node based on some part of the
input model.

The first argument is a function which chooses a `String` to render from
the model. The function also has access to the context of the component.

For example:

```
> :type text \_ctx model -> model.title
forall channel context a r.
  SDOM channel context
    { title :: String
    | r
    }
    a
```

#### `text_`

``` purescript
text_ :: forall channel context i o. String -> SDOM channel context i o
```

Create a component which renders a (static) text node.

#### `Attr`

``` purescript
newtype Attr context model
```

An attribute which can be associated with an `element`.

The type arguments correspond to the context and model types of the resulting
component.

Attributes can be constructed using the functions in the `SDOM.Attributes`
module, or unsafely using the `unsafeAttr` function.

For example:

```
> import SDOM.Attributes as A
> :type A.type_ \_ model -> model.type
forall context r.
  Attr context
    { "type" :: String
    | r
    }
```

#### `unsafeAttr`

``` purescript
unsafeAttr :: forall context model. (forall eff. context -> Element -> { init :: model -> Eff (dom :: DOM | eff) Unit, update :: { old :: model, new :: model } -> Eff (dom :: DOM | eff) Unit }) -> Attr context model
```

Create an attribute unsafely, by providing functions which initialize
and update the attribute.

_Note_: most applications should not require this function. Consider using
the functions in the `SDOM.Attributes` module instead.

#### `Handler`

``` purescript
newtype Handler context e
```

An event handler which can be associated with an `element`.

The `context` type argument corresponds to the context type of the resulting
component. The `e` type argument represents the type of event which will be
handled. This might take into account the _event channel_ of the component.

Event handlers can be constructed using the functions in the `SDOM.Events`
module, or by using the `handler` function.

For example:

```
> import SDOM.Events as Events
> :type Events.click \_ _ -> unit
forall context. Handler context Unit
```

#### `handler`

``` purescript
handler :: forall context e. String -> (context -> Event -> e) -> Handler context e
```

Create a `Handler` for specific events.

The first argument is the name of the type of events to handle.

The second argument is a function which produces a result from the raw DOM
event object. The function also has access to the context of the component.

#### `element`

``` purescript
element :: forall channel context i o. String -> Array (Attr context i) -> Array (Handler context (Either channel (i -> o))) -> Array (SDOM channel context i o) -> SDOM channel context i o
```

Create a component which renders an element, including attributes, event
handlers and a (static) list of child components.

Instead of using this function directly, you probably will want to use the
helper functions in the `SDOM.Elements` module.

The first argument is the name of the element.

The second argument is an array of attributes to attach to the rendered element.

The third argument is an array of event handlers. Note that the result types
of each handler is `Either channel (i -> o)`. That is, an event can _either_
update the state of the current component (by providing a function of type
`i -> o`), or it can use the _event channel_ to pass a message to a parent
component.

The fourth argument is a (static) array of child components.

For example:

```
> import SDOM.Elements as E
> :type E.div [] [] [ text \_ _ -> "Hello, World!"]
forall context channel i o.
  SDOM context channel i o

> import SDOM.Attributes as A
> :type E.input [ A.value \_ model -> model.value ] [] []
forall context channel o r.
  SDOM context channel
    { value :: String
    | r
    }
    o

> import SDOM.Events as Events
> import Unsafe.Coerce (unsafeCoerce)
> :paste
> :type E.input
    [ value \_ model -> model.value ]
    [ change \_ e -> pure \model ->
        model { value = (unsafeCoerce e).target.value }
    ]
    []
^D
forall context channel o r.
  SDOM context channel
    { value :: String
    | r
    }
    { value :: String
    | r
    }
```

#### `element_`

``` purescript
element_ :: forall channel context i o. String -> Array (SDOM channel context i o) -> SDOM channel context i o
```

Create a component which renders an element with a (static) array of child
components, but no attributes or event handlers.

Instead of using this function directly, you probably will want to use the
helper functions in the `SDOM.Elements` module.

For example:

```
> import SDOM.Elements as E
> :type E.div_ [ text \_ _ -> "Hello, World!"]
forall context channel i o.
  SDOM context channel i o
```

#### `ArrayChannel`

``` purescript
data ArrayChannel i channel
  = Parent channel
  | Here (Array i -> Array i)
```

The event channel for an `array` component.

An event is either passed to the next `Parent` in the chain, or handled
`Here`, by acting on the array itself.

#### `ArrayContext`

``` purescript
type ArrayContext context = { index :: Int, parent :: context }
```

The context of subcomponent in an `array` component includes the current
context inherited from the parent, as well as the index of the current
subcomponent.

#### `array`

``` purescript
array :: forall channel context i. String -> SDOM (ArrayChannel i channel) (ArrayContext context) i i -> SDOM channel context (Array i) (Array i)
```

Create a component which renders an array of subcomponents.

The first argument is the name of the HTML element used as the container.

The second argument is a template component for rendered subcomponents.

_Note:_

- The context of the template component provides access to the index of
  the current subcomponent.
- The event channel for the template component provides the ability to
  modify the input array itself.
- This component is optimized for edits at the end of the array. Small
  arrays should not present any issues, but large arrays might if edits
  typically take place away from the end of the array.

#### `attach`

``` purescript
attach :: forall eff model. Element -> model -> SDOM Void Unit model model -> Eff (dom :: DOM, frp :: FRP, ref :: REF | eff) { push :: (model -> model) -> Eff (dom :: DOM, frp :: FRP, ref :: REF | eff) Unit, detach :: Eff (dom :: DOM, frp :: FRP, ref :: REF | eff) Unit }
```

Attach a component to the DOM.

The first argument is the DOM `Element` which will contain the rendered
component.

The second argument is the initial model.

The third argument is the component itself.

The result contains two functions:

- The `push` function allows the caller to provide additional model updates
  which do not arise from user-generated events.
- `The `detach` function detaches the component from the DOM and unregisters
  any event handlers.

#### `unsafeSDOM`

``` purescript
unsafeSDOM :: forall channel context i o. (forall eff. Node -> context -> i -> Event { old :: i, new :: i } -> Eff (dom :: DOM, frp :: FRP, ref :: REF | eff) { events :: Event (Either channel (i -> o)), unsubscribe :: Eff (dom :: DOM, frp :: FRP, ref :: REF | eff) Unit }) -> SDOM channel context i o
```

This function is provided in order to wrap existing Javascript components.

Most applications should not need to use this function directly. Instead,
you can build components using the other, safe functions exposed by this
module, or reuse components from the `SDOM.Components` module.

This function accepts a function as its only argument. This function should:

- Set up any DOM components and render the initial model,
- Subscribe to model updates in order to update those components,
- Return an `events` stream for user events generated by the component,
- Return an `unsubscribe` function to clean up any event handlers when the
  component is removed.

#### `mapContext`

``` purescript
mapContext :: forall channel context context' i o. (context' -> context) -> SDOM channel context i o -> SDOM channel context' i o
```

Change the context type of a component.

#### `mapChannel`

``` purescript
mapChannel :: forall channel channel' context i o. (channel -> channel') -> SDOM channel context i o -> SDOM channel' context i o
```

Change the event channel type of a component.

#### `interpretChannel`

``` purescript
interpretChannel :: forall channel channel' context i o. (Event channel -> Event (Either channel' (i -> o))) -> SDOM channel context i o -> SDOM channel' context i o
```

Interpret the event channel of a component.

#### `withAsync`

``` purescript
withAsync :: forall channel context i o. SDOM (Event (Either channel (i -> o))) context i o -> SDOM channel context i o
```

A convenience function which provides the ability to use `Event`s
directly in a component's event channel.

`Event`s will be disposed of when the component unmounts, or when a new
event takes its place.

For example, clicking this button starts a timer which raises a `Unit`
event every second.

```
> :type text (const id)
forall channel context a. SDOM channel context String a

> import SDOM.Elements as E
> import SDOM.Events as Events

> handler _ _ = Left (interval 1000 $> Left unit)

> :type withAsync (E.button [] [Events.click handler] [ text \_ _ -> "Start" ])
forall channel context model. SDOM Unit channel context model
```


