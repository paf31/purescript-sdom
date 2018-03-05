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
import Data.Symbol (SProxy(..))
import Data.Tuple (Tuple(..))
import FRP (FRP)
import StaticDOM (ArrayChannel(..), ArrayContext, StaticDOM, array, change,
                  checked, click, for, id_, runStaticDOM, text, type_, value)
import StaticDOM.Elements (button, div_, h1_, input, label, li_, p_, span_)
import Unsafe.Coerce (unsafeCoerce)

infix 4 Tuple as :=

textbox :: forall ch ctx. StaticDOM ch ctx String String
textbox =
  input
    [ \_ -> value \val -> val ]
    [ \_ -> change \e -> pure \_ -> (unsafeCoerce e).target.value ]
    []

checkbox
  :: forall model ch ctx
   . (ctx -> model -> String)
  -> Lens' model Boolean
  -> StaticDOM ch ctx model model
checkbox name _checked =
  span_
    [ input
        [ \_   -> type_   \_     -> "checkbox"
        , \_   -> checked \model -> view _checked model
        , \ctx -> id_     \model -> name ctx model
        ]
        [ \_   -> change  \e     -> pure \model ->
            set _checked (unsafeCoerce e).target.checked model
        ]
        []
    , label
        [ \ctx -> for \model -> name ctx model ]
        []
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
      []
      [ \{ index } -> click \_ -> Left (Here (fromMaybe <*> deleteAt index)) ]
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
          []
          [ \_ -> click \_ -> pure \xs -> xs <> [emptyTask] ]
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
