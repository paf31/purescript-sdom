## Module SDOM.Components

#### `textbox`

``` purescript
textbox :: forall channel context. SDOM channel context String String
```

Render a textbox component whose model is a `String`.

_Note_: the model type can easily be changed using a lens.

#### `checkbox`

``` purescript
checkbox :: forall model channel context. (context -> model -> String) -> (model -> Boolean) -> (model -> Boolean -> model) -> SDOM channel context model model
```

Render a checkbox and an accompanying `label` inside a `span`.

The first argument chooses a unique name for the input component so that it
can be connected to the label.

The second and third arguments encapsulate the `checked` status of the
checkbox as a getter/setter pair.


