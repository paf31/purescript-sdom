module SDOM.Attributes
  ( for
  , id
  , name
  , className
  , type_
  , value
  , checked
  , disabled
  ) where

import Prelude
import DOM.HTML.HTMLInputElement (setChecked, setDisabled, setValue)
import DOM.Node.Element (removeAttribute, setAttribute)
import SDOM (Attr, unsafeAttr)
import Unsafe.Coerce (unsafeCoerce)

attr :: forall context model. String -> (context -> model -> String) -> Attr context model
attr attrName f =
  unsafeAttr \context e ->
    { init: \model -> setAttribute attrName (f context model) e
    , update: \{ old, new } -> do
        let oldValue = f context old
            newValue = f context new
        when (oldValue /= newValue) (setAttribute attrName newValue e)
    }

for :: forall context model. (context -> model -> String) -> Attr context model
for = attr "for"

id :: forall context model. (context -> model -> String) -> Attr context model
id = attr "id"

className :: forall context model. (context -> model -> String) -> Attr context model
className = attr "class"

name :: forall context model. (context -> model -> String) -> Attr context model
name = attr "name"

type_ :: forall context model. (context -> model -> String) -> Attr context model
type_ = attr "type"

value :: forall context model. (context -> model -> String) -> Attr context model
value f =
  unsafeAttr \context e ->
    let update s = do
          setValue s (unsafeCoerce e)
          setAttribute "value" s e
     in { init: \model -> update (f context model)
        , update: \{ old, new } -> do
            let oldValue = f context old
                newValue = f context new
            when (oldValue /= newValue) (update newValue)
        }

checked :: forall context model. (context -> model -> Boolean) -> Attr context model
checked f =
  unsafeAttr \context e ->
    let update b = do
          setChecked b (unsafeCoerce e)
          if b then setAttribute "checked" "checked" e
               else removeAttribute "checked" e
     in { init: \model -> update (f context model)
        , update: \{ old, new } -> do
            let oldValue = f context old
                newValue = f context new
            when (oldValue /= newValue) (update newValue)
        }

disabled :: forall context model. (context -> model -> Boolean) -> Attr context model
disabled f =
  unsafeAttr \context e ->
    let update b = do
          setDisabled b (unsafeCoerce e)
          if b then setAttribute "disabled" "disabled" e
               else removeAttribute "disabled" e
     in { init: \model -> update (f context model)
        , update: \{ old, new } -> do
            let oldValue = f context old
                newValue = f context new
            when (oldValue /= newValue) (update newValue)
        }
