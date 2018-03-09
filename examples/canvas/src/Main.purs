module Main where

import Prelude

import Color (rgba, white)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (EXCEPTION, throw)
import Control.Monad.Eff.Ref (REF)
import Control.Monad.Eff.Unsafe (unsafeCoerceEff)
import Control.Plus (empty)
import DOM (DOM)
import DOM.HTML (window)
import DOM.HTML.Types (htmlDocumentToDocument, htmlDocumentToNonElementParentNode)
import DOM.HTML.Window (document)
import DOM.Node.Document (createElement)
import DOM.Node.Node (appendChild)
import DOM.Node.NonElementParentNode (getElementById)
import DOM.Node.Types (elementToNode)
import Data.Int (round, toNumber)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Newtype (wrap)
import Data.Profunctor (dimap, lmap)
import FRP (FRP)
import FRP.Event (subscribe)
import Global (readInt)
import Graphics.Canvas (getContext2D, setCanvasHeight, setCanvasWidth)
import Graphics.Drawing (Drawing, circle, fillColor, filled, rectangle, render)
import SDOM (SDOM, attach, text, unsafeSDOM)
import SDOM.Components (textbox)
import SDOM.Elements as E
import Unsafe.Coerce (unsafeCoerce)

drawing :: forall channel context model. SDOM channel context Drawing model
drawing = unsafeSDOM \node _ d updates -> unsafeCoerceEff do
  doc <- window >>= document
  canvasEl <- createElement "canvas" (htmlDocumentToDocument doc)
  let canvas = unsafeCoerce canvasEl
  _ <- setCanvasWidth 200.0 canvas
  _ <- setCanvasHeight 200.0 canvas
  context <- getContext2D canvas
  _ <- appendChild (elementToNode canvasEl) node
  render context d
  unsubscribe <- updates `subscribe` \{ new } -> render context new
  pure
    { events: empty
    , unsubscribe: unsafeCoerceEff unsubscribe
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
    [ E.h1_ [ text \_ _ -> "Canvas" ]
    , lmap renderCircle drawing
    , E.p_ [ text \_ _ -> "Radius: "
           , dimap show (round <<< readInt 10) textbox
           ]
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
      attach el 100 app
    Nothing -> throw "No 'container' node!"
