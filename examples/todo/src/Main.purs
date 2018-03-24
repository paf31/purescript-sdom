module Main where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Exception (EXCEPTION, throw)
import Control.Monad.Eff.Ref (REF)
import DOM (DOM)
import DOM.HTML (window)
import DOM.HTML.Types (htmlDocumentToNonElementParentNode)
import DOM.HTML.Window (document)
import DOM.Node.NonElementParentNode (getElementById)
import Data.Incremental.Eq (WrappedEq, mapEq)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Newtype (wrap)
import FRP (FRP)
import SDOM (SDOM, array, attach, text, text_)
import SDOM.Components (textbox)
import SDOM.Elements as E
import SDOM.Events as Events
import SDOM.SnocArray as Array

-- type Task =
--   { description :: WrappedEq String
--   , completed :: WrappedEq Boolean
--   }
--
-- emptyTask :: Task
-- emptyTask =
--   { description: wrap ""
--   , completed: wrap false
--   }
--
-- task
--   :: forall channel context
--    . SDOM
--        (ArrayChannel Task channel)
--        (ArrayContext context)
--        Task
-- task = E.span_
--   [ checkbox
--       (\{ index } _ -> constant (wrap ("task-" <> show index)))
--       ?X --_.completed
--       ?x --(_ { completed = _ })
--   , prop (SProxy :: SProxy "description") textbox
--   , E.button
--       []
--       [ Events.click \{ index } _ -> Left (Here (fromMaybe <*> deleteAt index)) ]
--       [ text_ "✕" ]
--   ]

type TaskList = Array.SnocArray (WrappedEq String)

taskList
  :: forall channel context
   . SDOM channel context TaskList
taskList =
  E.div_
    [ E.h1_ [ text_ "Task List" ]
    , E.button
        []
        [ Events.click \_ _ -> pure (Array.snoc (wrap "")) ]
        [ text_ "＋ New Task" ]
    , array "ol" (E.li_ [ textbox ])
    , E.p_ [ text \_ -> Array.length >>> mapEq (show >>> (_ <> " tasks remaining.")) ]
    ]

main :: Eff ( dom :: DOM
            , exception :: EXCEPTION
            , frp :: FRP
            , ref :: REF
            , console :: CONSOLE
            ) Unit
main = do
  document <- map htmlDocumentToNonElementParentNode (window >>= document)
  container <- getElementById (wrap "container") document
  case container of
    Just el -> void do
      -- attach el (wrap "something") (E.div_ [ textbox, textbox ])
      attach el (wrap []) taskList
    Nothing -> throw "No 'container' node!"
