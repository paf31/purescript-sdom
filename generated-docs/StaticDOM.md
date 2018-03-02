## Module StaticDOM

#### `StaticDOM`

``` purescript
newtype StaticDOM eff ch i o
```

##### Instances
``` purescript
Functor (StaticDOM eff ch i)
Profunctor (StaticDOM eff ch)
Strong (StaticDOM eff ch)
```

#### `SDFX`

``` purescript
type SDFX eff = (dom :: DOM, frp :: FRP | eff)
```

#### `Attr`

``` purescript
data Attr
  = StringAttr String
  | BooleanAttr Boolean
```

##### Instances
``` purescript
Eq Attr
```

#### `element`

``` purescript
element :: forall eff ch i o. String -> StrMap (i -> Attr) -> StrMap (Event -> Either ch (i -> o)) -> Array (StaticDOM (SDFX eff) ch i o) -> StaticDOM (SDFX eff) ch i o
```

#### `element_`

``` purescript
element_ :: forall eff ch i o. String -> Array (StaticDOM (SDFX eff) ch i o) -> StaticDOM (SDFX eff) ch i o
```

#### `ArrayChannel`

``` purescript
data ArrayChannel i channel
  = Parent channel
  | Here (Int -> Array i -> Array i)
```

#### `array`

``` purescript
array :: forall eff ch i. String -> StaticDOM (SDFX eff) (ArrayChannel i ch) i i -> StaticDOM (SDFX eff) ch (Array i) (Array i)
```

#### `text`

``` purescript
text :: forall eff ch i o. (i -> String) -> StaticDOM (SDFX eff) ch i o
```

#### `runStaticDOM`

``` purescript
runStaticDOM :: forall model eff. Element -> model -> StaticDOM (SDFX (ref :: REF | eff)) Void model model -> Eff (SDFX (ref :: REF | eff)) Unit
```


