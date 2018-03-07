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

#### `select`

``` purescript
select :: forall option channel context. (option -> { key :: String, label :: String }) -> (String -> option) -> Array option -> SDOM channel context option option
```

Render a select component.

The first and second arguments encapsulate the selected option
as a getter/setter pair on the model type.

The third argument converts an option to a unique key and a rendered label.

The fourth argument converts a key back into an option.

The fifth argument is an array of all available options.


