module Main where

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
import Data.Lens.Record (prop)
import Data.Maybe (Maybe(Nothing, Just), fromMaybe)
import Data.Newtype (wrap)
import Data.Profunctor (dimap)
import Data.Symbol (SProxy(..))
import FRP (FRP)
import SDOM (ArrayChannel(..), ArrayContext, SDOM, attach, array, text, text_)
import SDOM.Components (textbox, checkbox)
import SDOM.Elements as E
import SDOM.Events as Events

type Task =
  { description :: String
  , completed :: Boolean
  }

emptyTask :: Task
emptyTask =
  { description: ""
  , completed: false
  }

task
  :: forall channel context
   . SDOM
       (ArrayChannel Task channel)
       (ArrayContext context)
       Task
       Task
task = E.span_
  [ checkbox
      (\{ index } _ -> "task-" <> show index)
      _.completed
      (_ { completed = _ })
  , prop (SProxy :: SProxy "description") textbox
  , E.button
      []
      [ Events.click \{ index } _ -> Left (Here (fromMaybe <*> deleteAt index)) ]
      [ text_ "✕" ]
  ]

type TaskList =
  { tasks :: Array Task
  }

taskList
  :: forall channel context
   . SDOM channel context TaskList TaskList
taskList = dimap _.tasks { tasks: _ } $
    E.div_
      [ E.h1_ [ text_ "Task List" ]
      , E.button
          []
          [ Events.click \_ _ -> pure \xs -> xs <> [emptyTask] ]
          [ text_ "＋ New Task" ]
      , array "ol" (E.li_ [ task ])
      , E.p_ [ text \_ -> summaryLabel ]
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
      attach el { tasks: [] } taskList
    Nothing -> throw "No 'container' node!"
