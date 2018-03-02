module Test.Main where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (EXCEPTION, throw)
import Control.Monad.Eff.Ref (REF)
import DOM.HTML (window)
import DOM.HTML.Types (htmlDocumentToNonElementParentNode)
import DOM.HTML.Window (document)
import DOM.Node.NonElementParentNode (getElementById)
import Data.Array (deleteAt, filter, length, (:))
import Data.Either (Either(..))
import Data.Lens.Record (prop)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Newtype (wrap)
import Data.Profunctor (dimap)
import Data.StrMap (empty, fromFoldable, singleton)
import Data.Symbol (SProxy(..))
import Data.Tuple (Tuple(..))
import StaticDOM (ArrayChannel(..), Attr(..), SDFX, StaticDOM, array, element, element_, runStaticDOM, text)
import Unsafe.Coerce (unsafeCoerce)

input :: forall eff ch. StaticDOM (SDFX eff) ch String String
input =
  element "input"
    (singleton "value" (\value -> StringAttr value))
    (singleton "change" \e -> pure \_ -> (unsafeCoerce e).target.value)
    []

infix 4 Tuple as :=

checkbox
  :: forall eff model ch
   . (model -> String)
  -> (model -> Boolean)
  -> (model -> Boolean -> model)
  -> StaticDOM (SDFX eff) ch model model
checkbox name getChecked setChecked =
  element_ "span"
    [ element "input"
        (fromFoldable [ "type"    := \_     -> StringAttr "checkbox"
                      , "checked" := \model -> BooleanAttr (getChecked model)
                      , "id"      := \model -> StringAttr (name model)
                      ])
        (fromFoldable [ "change"  := \e -> pure \model -> setChecked model (unsafeCoerce e).target.checked
                      ])
        []
    , element "label"
        (fromFoldable [ "for"     := \model -> StringAttr (name model)
                      ])
        empty
        []
    ]

type Task =
  { name :: String
  , description :: String
  , completed :: Boolean
  }

emptyTask :: String -> Task
emptyTask name =
  { name
  , description: ""
  , completed: false
  }

task :: forall eff ch. StaticDOM (SDFX eff) ch Task Task
task = element_ "span"
  [ checkbox _.name _.completed (_ { completed = _ })
  , prop (SProxy :: SProxy "description") input
  ]

type TaskList =
  { tasks :: Array Task
  }

taskList :: forall eff ch. StaticDOM (SDFX eff) ch TaskList TaskList
taskList = dimap _.tasks { tasks: _ } $
    element_ "div"
      [ element_ "h1" [ text \_ -> "Task List" ]
      , addButton
      , array "ol" li
      , element_ "p" [ text summaryLabel ]
      ]
  where
    li =
      element "li"
        empty
        empty
        [ task
        , removeButton
        ]

    addButton =
      element "button"
        empty
        (singleton "click" \_ -> pure \xs -> emptyTask ("task" <> show (length xs)) : xs)
        [ text \_ -> "+ Add" ]

    removeButton =
      element "button"
        empty
        (singleton "click" \_ -> Left (Here \idx -> fromMaybe <*> deleteAt idx))
        [ text \_ -> "✕" ]

    summaryLabel =
      filter _.completed
      >>> length
      >>> show
      >>> (_ <> " tasks completed.")

main :: Eff (SDFX (exception :: EXCEPTION, ref :: REF)) Unit
main = do
  document <- map htmlDocumentToNonElementParentNode (window >>= document)
  container <- getElementById (wrap "container") document
  case container of
    Just el -> runStaticDOM el { tasks: [] } taskList
    Nothing -> throw "No 'container' node!"
