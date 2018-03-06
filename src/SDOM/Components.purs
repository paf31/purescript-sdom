module SDOM.Components where

import Prelude

import SDOM (SDOM)
import SDOM.Attributes as A
import SDOM.Elements as E
import SDOM.Events as Events
import Unsafe.Coerce (unsafeCoerce)

-- | Render a textbox component whose model is a `String`.
-- |
-- | _Note_: the model type can easily be changed using a lens.
textbox :: forall channel context. SDOM channel context String String
textbox =
  E.input
    [ A.value \_ val -> val ]
    [ Events.change \_ e -> pure \_ -> (unsafeCoerce e).target.value ]
    []

-- | Render a checkbox and an accompanying `label` inside a `span`.
-- |
-- | The first argument chooses a unique name for the input component so that it
-- | can be connected to the label.
-- |
-- | The second and third arguments encapsulate the `checked` status of the
-- | checkbox as a getter/setter pair.
checkbox
  :: forall model channel context
   . (context -> model -> String)
  -> (model -> Boolean)
  -> (model -> Boolean -> model)
  -> SDOM channel context model model
checkbox name getChecked setChecked =
  E.span_
    [ E.input
        [ A.type_ \_ _ -> "checkbox"
        , A.checked \_ model -> getChecked model
        , A.id \context model -> name context model
        ]
        [ Events.change \_ e -> pure \model ->
            setChecked model (unsafeCoerce e).target.checked
        ]
        []
    , E.label
        [ A.for \context model -> name context model ]
        []
        []
    ]
