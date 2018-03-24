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

import Control.Monad.Eff (Eff)
import DOM (DOM)
import DOM.HTML.HTMLInputElement (setChecked, setDisabled, setValue)
import DOM.Node.Element (removeAttribute, setAttribute)
import DOM.Node.Types (Element)
import Data.Incremental (class Patch, Jet, constant, fromChange)
import Data.Incremental.Eq (WrappedEq)
import Data.Maybe (Maybe(..))
import Data.Maybe.Last (Last(..))
import Data.Newtype (unwrap)
import SDOM (Attr, unsafeAttr)
import Unsafe.Coerce (unsafeCoerce)

unsafeAttrWith
  :: forall context model change value
   . Patch model change
  => (forall eff. Element -> value -> Eff (dom :: DOM | eff) Unit)
  -> (context -> Jet model -> Jet (WrappedEq value))
  -> Attr context model
unsafeAttrWith update f =
  unsafeAttr \context e ->
    { init: \model ->
        let j = f context (constant model)
         in update e (unwrap j.position)
    , update: \j -> do
        case fromChange (f context j).velocity of
          Last (Just newValue) -> update e newValue
          _ -> pure unit
    }

attr
  :: forall context model change
   . Patch model change
  => String
  -> (context -> Jet model -> Jet (WrappedEq String))
  -> Attr context model
attr attrName = unsafeAttrWith \e val -> setAttribute attrName val e

for
  :: forall context model change
   . Patch model change
  => (context -> Jet model -> Jet (WrappedEq String))
  -> Attr context model
for = attr "for"

id
  :: forall context model change
   . Patch model change
  => (context -> Jet model -> Jet (WrappedEq String))
  -> Attr context model
id = attr "id"

className
  :: forall context model change
   . Patch model change
  => (context -> Jet model -> Jet (WrappedEq String))
  -> Attr context model
className = attr "class"

name
  :: forall context model change
   . Patch model change
  => (context -> Jet model -> Jet (WrappedEq String))
  -> Attr context model
name = attr "name"

type_
  :: forall context model change
   . Patch model change
  => (context -> Jet model -> Jet (WrappedEq String))
  -> Attr context model
type_ = attr "type"

value
  :: forall context model change
   . Patch model change
  => (context -> Jet model -> Jet (WrappedEq String))
  -> Attr context model
value = unsafeAttrWith \e s -> do
  setValue s (unsafeCoerce e)
  setAttribute "value" s e

checked
  :: forall context model change
   . Patch model change
  => (context -> Jet model -> Jet (WrappedEq Boolean))
  -> Attr context model
checked = unsafeAttrWith \e b -> do
  setChecked b (unsafeCoerce e)
  if b then setAttribute "checked" "checked" e
       else removeAttribute "checked" e

disabled
  :: forall context model change
   . Patch model change
  => (context -> Jet model -> Jet (WrappedEq Boolean))
  -> Attr context model
disabled = unsafeAttrWith \e b -> do
  setDisabled b (unsafeCoerce e)
  if b then setAttribute "disabled" "disabled" e
       else removeAttribute "disabled" e
