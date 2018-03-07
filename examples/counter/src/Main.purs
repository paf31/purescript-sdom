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
import Data.Maybe (Maybe(Nothing, Just))
import Data.Newtype (wrap)
import FRP (FRP)
import SDOM (SDOM, attach, text)
import SDOM.Elements as E
import SDOM.Events as Events

counter
  :: forall channel context
   . SDOM channel context Int Int
counter =
  E.div_
    [ E.h1_ [ text \_ _ -> "Counter" ]
    , E.button
        []
        [ Events.click \_ _ -> pure \value -> value + 1 ]
        [ text \_ value -> "(" <> show value <> ") Increment" ]
    ]

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
      attach el 0 counter
    Nothing -> throw "No 'container' node!"
