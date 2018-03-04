module Test.Main where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (EXCEPTION, throw)
import Control.Monad.Eff.Ref (REF)
import DOM (DOM)
import DOM.HTML (window)
import DOM.HTML.Types (htmlDocumentToNonElementParentNode)
import DOM.HTML.Window (document)
import DOM.Node.NonElementParentNode (getElementById)
import Data.Array (deleteAt, filter, length)
import Data.Either (Either(..))
import Data.Lens (Lens', set, view)
import Data.Lens.Record (prop)
import Data.Maybe (Maybe(Nothing, Just), fromMaybe)
import Data.Newtype (wrap)
import Data.Profunctor (dimap)
import Data.StrMap (empty, fromFoldable, singleton)
import Data.Symbol (SProxy(..))
import Data.Tuple (Tuple(..))
import FRP (FRP)
import StaticDOM (ArrayChannel(..), Attr(..), StaticDOM, ArrayContext, array, runStaticDOM, text)
import StaticDOM.Elements (button, div_, h1_, input, label, li_, p_, span_)
import Unsafe.Coerce (unsafeCoerce)

infix 4 Tuple as :=

textbox :: forall ch ctx. StaticDOM ch ctx String String
textbox =
  input
    (singleton "value" (\_ value -> StringAttr value))
    (singleton "change" \_ e -> pure \_ -> (unsafeCoerce e).target.value)
    []

checkbox
  :: forall model ch ctx
   . (ctx -> model -> String)
  -> Lens' model Boolean
  -> StaticDOM ch ctx model model
checkbox name _checked =
  span_
    [ input
        (fromFoldable [ "type"    := \_   _     -> StringAttr "checkbox"
                      , "checked" := \_   model -> BooleanAttr (view _checked model)
                      , "id"      := \ctx model -> StringAttr (name ctx model)
                      ])
        (fromFoldable [ "change"  := \_   e     -> pure \model -> set _checked (unsafeCoerce e).target.checked model
                      ])
        []
    , label
        (fromFoldable [ "for"     := \ctx model -> StringAttr (name ctx model)
                      ])
        empty
        []
    ]

type Task =
  { description :: String
  , completed :: Boolean
  }

emptyTask :: Task
emptyTask =
  { description: ""
  , completed: false
  }

task :: forall ch ctx. StaticDOM (ArrayChannel Task ch) (ArrayContext ctx) Task Task
task = span_
  [ checkbox
      (\{ index } _ -> "task-" <> show index)
      (prop (SProxy :: SProxy "completed"))
  , prop (SProxy :: SProxy "description") textbox
  , button
      empty
      (singleton "click" \{ index } _ -> Left (Here (fromMaybe <*> deleteAt index)))
      [ text \_ _ -> "✕" ]
  ]

type TaskList =
  { tasks :: Array Task
  }

taskList :: forall ch ctx. StaticDOM ch ctx TaskList TaskList
taskList = dimap _.tasks { tasks: _ } $
    div_
      [ h1_ [ text \_ _ -> "Task List" ]
      , button
          empty
          (singleton "click" \_ _ -> pure \xs -> xs <> [emptyTask])
          [ text \_ _ -> "＋ New Task" ]
      , array "ol" (li_ [ task ])
      , p_ [ text \_ -> summaryLabel ]
      ]
  where
    summaryLabel =
      filter _.completed
      >>> length
      >>> show
      >>> (_ <> " tasks completed.")

main :: Eff ( dom :: DOM
            , exception :: EXCEPTION
            , frp :: FRP
            , ref :: REF
            ) Unit
main = do
  document <- map htmlDocumentToNonElementParentNode (window >>= document)
  container <- getElementById (wrap "container") document
  case container of
    Just el -> void do
      runStaticDOM el { tasks: [] } taskList
    Nothing -> throw "No 'container' node!"
