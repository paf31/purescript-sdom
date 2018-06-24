module Main where

import Prelude

import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Exception (throw)
import FRP.Event (Event)
import FRP.Event.Time (interval)
import SDOM (SDOM, attach, mapChannel, withAsync, text, text_)
import SDOM.Attributes as A
import SDOM.Elements as E
import SDOM.Events as Events
import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.HTML.Window (document)

data Mode = Increasing | Decreasing | Neither

derive instance eqMode :: Eq Mode

type State =
  { mode :: Mode
  , value :: Int
  }

counter
  :: forall context
   . SDOM Mode context State State
counter =
  E.div_
    [ E.h1_ [ text_ "Async" ]
    , E.p_ [ text \_ { value } -> show value ]
    , E.p_
      [ E.button
          [ A.disabled \_ { mode } -> mode == Decreasing ]
          [ Events.click \_ _ -> Left Decreasing ]
          [ text_ "Decrement" ]
      , text_ " "
      , E.button
          [ A.disabled \_ { mode } -> mode == Neither ]
          [ Events.click \_ _ -> Left Neither ]
          [ text_ "Stop" ]
      , text_ " "
      , E.button
        [ A.disabled \_ { mode } -> mode == Increasing ]
        [ Events.click \_ _ -> Left Increasing ]
        [ text_ "Increment" ]
      ]
    ]

-- We must interpret the event channel (of type `Mode`) using the
-- `mapChannel` function. We can return an `Event`, which gives us the
-- ability to deliver results asynchronously using `withAsync`.
counter_ :: forall channel context. SDOM channel context State State
counter_ =
    withAsync (mapChannel (map Right <<< interpreter) counter)
  where
    interpreter :: Mode -> Event (State -> State)
    interpreter Increasing = interval 100 $> \{ value } -> { mode: Increasing, value: value + 1 }
    interpreter Decreasing = interval 100 $> \{ value } -> { mode: Decreasing, value: value - 1 }
    interpreter Neither = pure \{ value } -> { mode: Neither, value }

main :: Effect Unit
main = do
  document <- map toNonElementParentNode (window >>= document)
  container <- getElementById "container" document
  case container of
    Just el -> void do
      attach el { value: 0, mode: Neither } counter_
    Nothing -> throw "No 'container' node!"
