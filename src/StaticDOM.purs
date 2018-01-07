module StaticDOM where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.ST (ST, newSTRef, readSTRef, writeSTRef)
import DOM (DOM)
import DOM.Event.Event (Event)
import DOM.Event.EventTarget (addEventListener, eventListener)
import DOM.HTML (window)
import DOM.HTML.Types (htmlDocumentToDocument)
import DOM.HTML.Window (document)
import DOM.Node.Document (createElement, createTextNode)
import DOM.Node.Element (setAttribute)
import DOM.Node.Node (appendChild, setTextContent)
import DOM.Node.Types (Element, Node, elementToEventTarget, elementToNode, textToNode)
import Data.Array.ST (emptySTArray, freeze, pushSTArray)
import Data.Foldable (traverse_)
import Data.FoldableWithIndex (traverseWithIndex_)
import Data.Newtype (wrap)
import Data.Profunctor (class Profunctor, dimap)
import Data.Profunctor.Strong (class Strong, first, second)
import Data.StrMap as StrMap
import Data.Tuple (fst, snd)

data StaticDOM i o
  = Text (i -> String)
  | Element { el :: String
            , attrs :: StrMap.StrMap (i -> String)
            , handlers :: StrMap.StrMap (Event -> i -> o)
            , children :: Array (StaticDOM i o)
            }

derive instance functorStaticDOM :: Functor (StaticDOM i)

instance profunctorStaticDOM :: Profunctor StaticDOM where
  dimap f _ (Text k) = Text (f >>> k)
  dimap f g (Element { el, attrs, handlers, children }) =
    Element
      { el
      , attrs: map (f >>> _) attrs
      , handlers: map (map ((f >>> _) >>> (_ >>> g))) handlers
      , children: map (dimap f g) children
      }

instance strongStaticDOM :: Strong StaticDOM where
  first (Text k) = Text (fst >>> k)
  first (Element { el, attrs, handlers, children }) =
    Element
      { el
      , attrs: map (fst >>> _) attrs
      , handlers: map (map first) handlers
      , children: map first children
      }
  second (Text k) = Text (snd >>> k)
  second (Element { el, attrs, handlers, children }) =
    Element
      { el
      , attrs: map (snd >>> _) attrs
      , handlers: map (map second) handlers
      , children: map second children
      }

runStaticDOM
  :: forall model eff h
   . Element
  -> model
  -> StaticDOM model model
  -> Eff (dom :: DOM, st :: ST h | eff) Unit
runStaticDOM root model v = do
  modelRef <- newSTRef model
  listeners <- emptySTArray
  document <- window >>= document
  let go :: Node -> StaticDOM model model -> Eff (dom :: DOM, st :: ST h | eff) Unit
      go n (Text s) = void do
        tn <- createTextNode (s model) (htmlDocumentToDocument document)
        _ <- appendChild (textToNode tn) n
        pushSTArray listeners \newModel ->
          setTextContent (s newModel) (textToNode tn)
      go n (Element { el, attrs, handlers, children }) = void do
        ne <- createElement el (htmlDocumentToDocument document)
        traverseWithIndex_ (setAttr ne) attrs
        traverseWithIndex_ (setHandler ne) handlers
        traverse_ (go (elementToNode ne)) children
        _ <- appendChild (elementToNode ne) n
        pure ne

      setAttr :: Element -> String -> (model -> String) -> Eff (dom :: DOM, st :: ST h | eff) Unit
      setAttr e k s = void do
        setAttribute k (s model) e
        pushSTArray listeners \newModel ->
          setAttribute k (s newModel) e

      setHandler :: Element -> String -> (Event -> model -> model) -> Eff (dom :: DOM, st :: ST h | eff) Unit
      setHandler e k f = do
          addEventListener (wrap k) (eventListener updateState) false (elementToEventTarget e)
        where
          updateState evt = do
            oldModel <- readSTRef modelRef
            let newModel = f evt oldModel
            _ <- writeSTRef modelRef newModel
            ls <- freeze listeners
            traverse_ (\l -> l newModel) ls
  go (elementToNode root) v
