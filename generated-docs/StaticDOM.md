## Module StaticDOM

#### `StaticDOM`

``` purescript
newtype StaticDOM ch ctx i o
```

##### Instances
``` purescript
Functor (StaticDOM ch ctx i)
Profunctor (StaticDOM ch ctx)
Strong (StaticDOM ch ctx)
```

#### `Attr`

``` purescript
newtype Attr model
```

#### `checked`

``` purescript
checked :: forall model. (model -> Boolean) -> Attr model
```

#### `disabled`

``` purescript
disabled :: forall model. (model -> Boolean) -> Attr model
```

#### `for`

``` purescript
for :: forall model. (model -> String) -> Attr model
```

#### `id_`

``` purescript
id_ :: forall model. (model -> String) -> Attr model
```

#### `name`

``` purescript
name :: forall model. (model -> String) -> Attr model
```

#### `type_`

``` purescript
type_ :: forall model. (model -> String) -> Attr model
```

#### `value`

``` purescript
value :: forall model. (model -> String) -> Attr model
```

#### `Handler`

``` purescript
newtype Handler e
```

#### `change`

``` purescript
change :: forall e. (Event -> e) -> Handler e
```

#### `click`

``` purescript
click :: forall e. (Event -> e) -> Handler e
```

#### `element`

``` purescript
element :: forall ch ctx i o. String -> Array (ctx -> Attr i) -> Array (ctx -> Handler (Either ch (i -> o))) -> Array (StaticDOM ch ctx i o) -> StaticDOM ch ctx i o
```

#### `element_`

``` purescript
element_ :: forall ch ctx i o. String -> Array (StaticDOM ch ctx i o) -> StaticDOM ch ctx i o
```

#### `ArrayChannel`

``` purescript
data ArrayChannel i channel
  = Parent channel
  | Here (Array i -> Array i)
```

#### `ArrayContext`

``` purescript
type ArrayContext ctx = { index :: Int, parent :: ctx }
```

#### `array`

``` purescript
array :: forall ch ctx i. String -> StaticDOM (ArrayChannel i ch) (ArrayContext ctx) i i -> StaticDOM ch ctx (Array i) (Array i)
```

#### `text`

``` purescript
text :: forall ch ctx i o. (ctx -> i -> String) -> StaticDOM ch ctx i o
```

#### `runStaticDOM`

``` purescript
runStaticDOM :: forall eff model. Element -> model -> StaticDOM Void Unit model model -> Eff (dom :: DOM, frp :: FRP, ref :: REF | eff) (Eff (dom :: DOM, frp :: FRP, ref :: REF | eff) Unit)
```


