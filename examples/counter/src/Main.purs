module Main where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Exception (throw)
import SDOM (SDOM, attach, text, text_)
import SDOM.Elements as E
import SDOM.Events as Events
import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.HTML.Window (document)

counter
  :: forall channel context
   . SDOM channel context Int Int
counter =
  E.div_
    [ E.h1_ [ text_ "Counter" ]
    , E.button
        []
        [ Events.click \_ _ -> pure \value -> value + 1 ]
        [ text \_ value -> "(" <> show value <> ") Increment" ]
    ]

main :: Effect Unit
main = do
  document <- map toNonElementParentNode (window >>= document)
  container <- getElementById "container" document
  case container of
    Just el -> void do
      attach el 0 counter
    Nothing -> throw "No 'container' node!"
