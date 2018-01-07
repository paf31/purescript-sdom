module Test.Main where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (EXCEPTION, throw)
import Control.Monad.ST (runST)
import DOM (DOM)
import DOM.HTML (window)
import DOM.HTML.Types (htmlDocumentToNonElementParentNode)
import DOM.HTML.Window (document)
import DOM.Node.NonElementParentNode (getElementById)
import Data.Lens.Record (prop)
import Data.Maybe (Maybe(..))
import Data.Newtype (wrap)
import Data.Profunctor (lmap)
import Data.StrMap (empty, singleton)
import Data.String (toUpper)
import Data.Symbol (SProxy(..))
import StaticDOM (StaticDOM(..), runStaticDOM)
import Unsafe.Coerce (unsafeCoerce)

button :: StaticDOM Int Int
button =
  Element
    { el: "button"
    , attrs: singleton "style" \counter ->
        if counter `mod` 2 > 0 then "color: red" else ""
    , handlers: singleton "click" \_ counter ->
        counter + 1
    , children: [
        Text \counter ->
          show counter <> " (click to increment)"
      ]
    }

input :: StaticDOM String String
input =
  Element
    { el: "input"
    , attrs: singleton "value" (\value -> value)
    , handlers: singleton "change" \e _ -> (unsafeCoerce e).target.value
    , children: []
    }

label :: StaticDOM String String
label =
  Element
    { el: "span"
    , attrs: singleton "value" \value -> value
    , handlers: singleton "change" \e _ -> (unsafeCoerce e).target.value
    , children: [
        Text \value -> value
      ]
    }

type Model =
  { counter1 :: Int
  , counter2 :: Int
  , label :: String
  }

view :: StaticDOM Model Model
view =
  Element
    { el: "div"
    , attrs: empty
    , handlers: empty
    , children: [ prop (SProxy :: SProxy "counter1") button
                , prop (SProxy :: SProxy "counter2") button
                , prop (SProxy :: SProxy "label") input
                , prop (SProxy :: SProxy "label") (lmap toUpper label)
                ]
    }

type FX =
  ( dom :: DOM
  , exception :: EXCEPTION
  )

main :: Eff FX Unit
main = runST do
  document <- map htmlDocumentToNonElementParentNode (window >>= document)
  container <- getElementById (wrap "container") document
  case container of
    Just el -> runStaticDOM el { counter1: 0, counter2: 0, label: "change me" } view
    Nothing -> throw "No 'container' node!"
