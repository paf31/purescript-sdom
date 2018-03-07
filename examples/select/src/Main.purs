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
import Data.Maybe (Maybe(..))
import Data.Newtype (wrap)
import FRP (FRP)
import SDOM (SDOM, attach, text)
import SDOM.Components as Components
import SDOM.Elements as E

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
    [ E.h1_ [ text \_ _ -> "Select" ]
    , E.p_
      [ text \_ _ -> "Choose a product: "
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
      attach el BasicWidget select
    Nothing -> throw "No 'container' node!"
