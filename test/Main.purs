module Test.Main where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Exception (EXCEPTION, throw)
import DOM (DOM)
import DOM.HTML (window)
import DOM.HTML.Types (htmlDocumentToNonElementParentNode)
import DOM.HTML.Window (document)
import DOM.Node.NonElementParentNode (getElementById)
import Data.Array (deleteAt, length, updateAt, (!!), (..), (:))
import Data.Lens (lens')
import Data.Lens.Record (prop)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Newtype (wrap)
import Data.StrMap (empty, singleton)
import Data.Symbol (SProxy(..))
import Data.Tuple (Tuple(..))
import StaticDOM (StaticDOM, element, element_, runStaticDOM, text)
import Unsafe.Coerce (unsafeCoerce)

array
  :: forall a
   . Int
  -> a
  -> (Int -> StaticDOM a a)
  -> StaticDOM (Array a) (Array a)
array n dflt f =
    element_ "div"
      [ addButton
      , element_ "ol" (map toChild (0 .. (n - 1)))
      ]
  where
    toChild idx =
      element "li"
        (singleton "style" \xs ->
          if idx < length xs
            then ""
            else "display: none")
        empty
        [ lens' (at idx) (f idx)
        , removeButton idx
        ]

    addButton =
      element "button"
        (singleton "style" \xs ->
          if length xs >= n
            then "display: none"
            else "")
        (singleton "click" \_ xs -> dflt : xs)
        [ text \_ -> "+ Add" ]

    removeButton idx =
      element "button"
        empty
        (singleton "click" \_ xs ->
          fromMaybe xs (deleteAt idx xs))
        [ text \_ -> "✕" ]

    at idx xs =
      Tuple (fromMaybe dflt (xs !! idx))
            (\x -> fromMaybe xs (updateAt idx x xs))

input :: StaticDOM String String
input =
  element "input"
    (singleton "value" (\value -> value))
    (singleton "change" \e _ -> (unsafeCoerce e).target.value)
    []

type Model =
  { tasks :: Array String
  }

view :: StaticDOM Model Model
view = element_ "div"
  [ prop (SProxy :: SProxy "tasks") (array 10 "" \_ -> input)
  ]

type FX =
  ( console :: CONSOLE
  , dom :: DOM
  , exception :: EXCEPTION
  )

main :: Eff FX Unit
main = do
  document <- map htmlDocumentToNonElementParentNode (window >>= document)
  container <- getElementById (wrap "container") document
  case container of
    Just el -> runStaticDOM el { tasks: [] } view
    Nothing -> throw "No 'container' node!"
