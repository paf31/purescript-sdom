module SDOM.Components where

import Prelude

import SDOM (SDOM, text_)
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

-- | Render a select component.
-- |
-- | The first and second arguments encapsulate the selected option
-- | as a getter/setter pair on the model type.
-- |
-- | The third argument converts an option to a unique key and a rendered label.
-- |
-- | The fourth argument converts a key back into an option.
-- |
-- | The fifth argument is an array of all available options.
select
  :: forall option channel context
   . (option -> { key :: String, label :: String })
  -> (String -> option)
  -> Array option
  -> SDOM channel context option option
select fromOption toOption options =
  E.select
    [ A.value \_ value -> (fromOption value).key ]
    [ Events.change \_ e -> pure \_ ->
        toOption (unsafeCoerce e).target.value
    ]
    (options <#> \option ->
      let { key, label } = fromOption option
       in E.option [ A.value \_ _ -> key ] [] [ text_ label ]
    )
