module Main where

import Prelude

import Color (rgba, white)
import Control.Plus (empty)
import Data.Int (round, toNumber)
import Data.Maybe (Maybe(..))
import Data.Profunctor (dimap, lcmap)
import Effect (Effect)
import Effect.Exception (throw)
import FRP.Event (subscribe)
import Global (readInt)
import Graphics.Canvas (getContext2D, setCanvasHeight, setCanvasWidth)
import Graphics.Drawing (Drawing, circle, fillColor, filled, rectangle, render)
import SDOM (SDOM, attach, text_, unsafeSDOM)
import SDOM.Components (textbox)
import SDOM.Elements as E
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM.Document (createElement)
import Web.DOM.Element (toNode)
import Web.DOM.Node (appendChild)
import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toDocument, toNonElementParentNode)
import Web.HTML.Window (document)

drawing :: forall channel context model. SDOM channel context Drawing model
drawing = unsafeSDOM \node _ d updates -> do
  doc <- window >>= document
  canvasEl <- createElement "canvas" (toDocument doc)
  let canvas = unsafeCoerce canvasEl
  _ <- setCanvasWidth canvas 200.0
  _ <- setCanvasHeight canvas 200.0
  context <- getContext2D canvas
  _ <- appendChild (toNode canvasEl) node
  render context d
  unsubscribe <- updates `subscribe` \{ new } -> render context new
  pure
    { events: empty
    , unsubscribe
    }

renderCircle :: Int -> Drawing
renderCircle radius =
  filled (fillColor (rgba 71 65 108 1.0)) (rectangle 0.0 0.0 200.0 200.0)
  <> filled (fillColor white) (circle 100.0 100.0 (toNumber radius))

app
  :: forall channel context
   . SDOM channel context Int Int
app =
  E.div_
    [ E.h1_ [ text_ "Canvas" ]
    , lcmap renderCircle drawing
    , E.p_ [ text_ "Radius: "
           , dimap show (round <<< readInt 10) textbox
           ]
    ]

main :: Effect Unit
main = do
  document <- map toNonElementParentNode (window >>= document)
  container <- getElementById "container" document
  case container of
    Just el -> void do
      attach el 100 app
    Nothing -> throw "No 'container' node!"
