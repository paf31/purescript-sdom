module Main where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Exception (throw)
import SDOM (SDOM, attach, text, text_)
import SDOM.Components as Components
import SDOM.Elements as E
import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.HTML.Window (document)

data WidgetType
  = BasicWidget
  | SuperWidget
  | UltraWidget

fromString :: String -> WidgetType
fromString "basic" = BasicWidget
fromString "super" = SuperWidget
fromString _       = UltraWidget

toString :: WidgetType -> String
toString BasicWidget = "basic"
toString SuperWidget = "super"
toString UltraWidget = "ultra"

labelFor :: WidgetType -> String
labelFor BasicWidget = "Basic widget"
labelFor SuperWidget = "Super widget"
labelFor UltraWidget = "Ultra widget"

priceOf :: WidgetType -> String
priceOf BasicWidget = "$9.99"
priceOf SuperWidget = "$99.99"
priceOf UltraWidget = "$999.99"

select
  :: forall channel context
   . SDOM channel context WidgetType WidgetType
select =
  E.div_
    [ E.h1_ [ text_ "Select" ]
    , E.p_
      [ text_ "Choose a product: "
      , Components.select
          (\option -> { key: toString option, label: labelFor option })
          fromString
          [ BasicWidget
          , SuperWidget
          , UltraWidget
          ]
      ]
    , E.p_ [ text \_ selectedProduct -> "The price is " <> priceOf selectedProduct ]
    ]

main :: Effect Unit
main = do
  document <- map toNonElementParentNode (window >>= document)
  container <- getElementById "container" document
  case container of
    Just el -> void do
      attach el BasicWidget select
    Nothing -> throw "No 'container' node!"
