module Test.Main where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (throw)
import DOM.HTML (window)
import DOM.HTML.Types (htmlDocumentToNonElementParentNode)
import DOM.HTML.Window (document)
import DOM.Node.NonElementParentNode (getElementById)
import Data.Array (updateAt, (!!), (:))
import Data.Lens.Record (prop)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Newtype (wrap)
import Data.StrMap (empty, singleton)
import Data.Symbol (SProxy(..))
import Data.Tuple (Tuple(..))
import Lists (StaticDOM, array, element, element_, runStaticDOM, text)
import Unsafe.Coerce (unsafeCoerce)

arrayOfInputs
  :: forall a
   . a
  -> StaticDOM _ a a
  -> StaticDOM _ (Array a) (Array a)
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
        -- , removeButton idx
        ]

    addButton =
      element "button"
        empty
        (singleton "click" \_ xs -> dflt : xs)
        [ text \_ -> "+ Add" ]

    -- removeButton idx =
    --   element "button"
    --     empty
    --     (singleton "click" \_ xs ->
    --       fromMaybe xs (deleteAt idx xs))
    --     [ text \_ -> "✕" ]

    at idx xs =
      Tuple (fromMaybe dflt (xs !! idx))
            (\x -> fromMaybe xs (updateAt idx x xs))

input :: StaticDOM _ String String
input =
  element "input"
    (singleton "value" (\value -> value))
    (singleton "change" \e _ -> (unsafeCoerce e).target.value)
    []

type Model =
  { tasks :: Array String
  }

view :: StaticDOM _ Model Model
view = element_ "div"
  [ prop (SProxy :: SProxy "tasks") (arrayOfInputs "" input)
  ]

main :: Eff _ Unit
main = do
  document <- map htmlDocumentToNonElementParentNode (window >>= document)
  container <- getElementById (wrap "container") document
  case container of
    Just el -> runStaticDOM el { tasks: [] } view
    Nothing -> throw "No 'container' node!"
