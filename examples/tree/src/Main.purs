module Main where

import Prelude

import Control.Lazy (defer)
import Data.Bifunctor (lmap)
import Data.Either (Either(..))
import Data.Lens (lens')
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Effect.Exception (throw)
import SDOM (ArrayChannel(..), SDOM, array, attach, mapContext, interpretChannel, text, text_)
import SDOM.Attributes as A
import SDOM.Elements as E
import SDOM.Events as Events
import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.HTML.Window (document)

data Tree a = Tree a (Array (Tree a))

derive instance functorTree :: Functor Tree

data TreeChannel i channel
  = ParentChannel channel
  | ModifyRoot (Tree i -> Tree i)

data TreeContext context
  = Root context
  | TreeContext Int (TreeContext context)

renderContext :: forall context. TreeContext context -> String
renderContext (Root _) = "Root"
renderContext (TreeContext i ctx) = renderContext ctx <> " / " <> show i

buildTree :: Int -> Tree Boolean
buildTree 0 = Tree false []
buildTree n = Tree false [ t, t ]
  where t = buildTree (n - 1)

tree
  :: forall channel context model
   . (model -> Boolean)
  -> SDOM (TreeChannel model channel) (TreeContext context) model model
  -> SDOM channel context (Tree model) (Tree model)
tree getExpanded leaf = interpretChannel (map treeChannel) (go leaf)
  where
    go :: forall channel' context'
        . SDOM channel' (TreeContext context') model model
       -> SDOM channel' context' (Tree model) (Tree model)
    go l = defer \_ ->
      E.li_
        [ mapContext Root
            $ lens' (\(Tree lf bs) -> Tuple lf (_ `Tree` bs))
            $ l
        , E.span [ A.className \_ (Tree model _) -> if getExpanded model then "" else "collapsed" ] []
            [ lens' (\(Tree lf bs) -> Tuple bs (Tree lf))
              $ array "ul"
              $ go
              $ interpretChannel (map (lmap Parent <<< Left))
              $ mapContext stepCtx
              $ l
            ]
        ]

    treeChannel
      :: TreeChannel model channel
      -> Either channel (Tree model -> Tree model)
    treeChannel (ParentChannel c) = Left c
    treeChannel (ModifyRoot f) = Right f

    stepCtx :: forall context'
             . TreeContext { index :: Int , parent :: context' }
            -> TreeContext context'
    stepCtx (Root { index, parent }) = TreeContext index (Root parent)
    stepCtx (TreeContext index context) = TreeContext index (stepCtx context)

node
  :: forall channel context
   . SDOM
       (TreeChannel Boolean channel)
       (TreeContext context)
       Boolean
       Boolean
node = E.span_ [ E.button
                   []
                   [ Events.click \_ b -> Right not ]
                   [ text \_ expanded -> if expanded then "-" else "+" ]
               , text \ctx _ -> renderContext ctx
               ]

app
  :: forall channel context
   . SDOM channel context (Tree Boolean) (Tree Boolean)
app =
  E.div_
    [ E.h1_ [ text_ "Tree" ]
    , E.div [ A.id \_ _ -> "tree" ] [] [ tree identity node ]
    ]

main :: Effect Unit
main = do
  document <- map toNonElementParentNode (window >>= document)
  container <- getElementById "container" document
  case container of
    Just el -> void do
      attach el (buildTree 4) app
    Nothing -> throw "No 'container' node!"
