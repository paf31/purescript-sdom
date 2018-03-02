module Test.Main where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (EXCEPTION, throw)
import Control.Monad.Eff.Ref (REF)
import DOM.HTML (window)
import DOM.HTML.Types (htmlDocumentToNonElementParentNode)
import DOM.HTML.Window (document)
import DOM.Node.NonElementParentNode (getElementById)
import Data.Array (deleteAt, (:))
import Data.Either (Either(..))
import Data.Lens.Record (prop)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Newtype (wrap)
import Data.StrMap (empty, singleton)
import Data.Symbol (SProxy(..))
import StaticDOM (StaticDOM, SDFX, array, element, element_, runStaticDOM, text)
import Unsafe.Coerce (unsafeCoerce)

arrayOfInputs
  :: forall eff a e
   . a
  -> StaticDOM (SDFX eff) (Either e (Int -> Array a -> Array a)) a a
  -> StaticDOM (SDFX eff) e (Array a) (Array a)
arrayOfInputs dflt f =
    element_ "div"
      [ addButton
      , array "ol" li
      ]
  where
    li =
      element "li"
        empty
        empty
        [ f
        , removeButton
        ]

    addButton =
      element "button"
        empty
        (singleton "click" \_ -> pure \xs -> dflt : xs)
        [ text \_ -> "+ Add" ]

    removeButton =
      element "button"
        empty
        (singleton "click" \_ -> (Left (Right \i -> fromMaybe <*> deleteAt i)))
        [ text \_ -> "✕" ]

input :: forall eff e. StaticDOM (SDFX eff) e String String
input =
  element "input"
    (singleton "value" (\value -> value))
    (singleton "change" \e -> pure \_ -> (unsafeCoerce e).target.value)
    []

type Model =
  { tasks :: Array String
  }

view :: forall eff. StaticDOM (SDFX eff) Void Model Model
view = element_ "div"
  [ prop (SProxy :: SProxy "tasks") (arrayOfInputs "" input)
  ]

main :: Eff (SDFX (exception :: EXCEPTION, ref :: REF)) Unit
main = do
  document <- map htmlDocumentToNonElementParentNode (window >>= document)
  container <- getElementById (wrap "container") document
  case container of
    Just el -> runStaticDOM el { tasks: [] } view
    Nothing -> throw "No 'container' node!"
