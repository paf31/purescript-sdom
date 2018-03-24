module SDOM.SnocArray
  ( SnocArray(..)
  , SnocArrayChange(..)
  , snoc
  , unsnoc
  , modifyAt
  , map
  , length
  ) where

import Prelude hiding (map)

import Data.Array (foldl, zipWith)
import Data.Array as Array
import Data.Foldable (foldMap)
import Data.Incremental (class Patch, Change, Jet, constant, fromChange, patch, toChange)
import Data.Incremental.Eq (WrappedEq)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Maybe.Last (Last(..))
import Data.Monoid (mempty)
import Data.Monoid.Additive (Additive(..))
import Data.Newtype (class Newtype, unwrap, wrap)
import Prelude as Prelude

newtype SnocArray a = SnocArray (Array a)

derive instance eqSnocArray :: Eq a => Eq (SnocArray a)

instance showSnocArray :: Show a => Show (SnocArray a) where
  show (SnocArray xs) = "(SnocArray " <> show xs <> ")"

derive instance newtypeSnocArray :: Newtype (SnocArray a) _

data SnocArrayChange a da
  = Snoc a
  | Unsnoc
  | ModifyAt Int da

derive instance eqSnocArrayChange :: (Eq a, Eq da) => Eq (SnocArrayChange a da)

instance showSnocArrayChange :: (Show a, Show da) => Show (SnocArrayChange a da) where
  show (Snoc a) = "(Snoc " <> show a <> ")"
  show Unsnoc = "Unsnoc"
  show (ModifyAt i da) = "(ModifyAt " <> show i <> " " <> show da <> ")"

instance patchSnocArray
    :: Patch a da
    => Patch (SnocArray a) (Array (SnocArrayChange a da)) where
  patch (SnocArray xs) = SnocArray <<< foldl patchOne xs where
    patchOne xs_ (Snoc x)   = Array.snoc xs_ x
    patchOne xs_ Unsnoc     = fromMaybe xs_ (Array.init xs_)
    patchOne xs_ (ModifyAt i da)  = fromMaybe xs_ (Array.modifyAt i (_ `patch` da) xs_)

snoc :: forall a da. Patch a da => a -> Change (SnocArray a)
snoc a = toChange [Snoc a]

unsnoc :: forall a da. Patch a da => Change (SnocArray a)
unsnoc = toChange [Unsnoc]

modifyAt :: forall a da. Patch a da => Int -> Change a -> Change (SnocArray a)
modifyAt i c = toChange [ModifyAt i (fromChange c)]

-- | Construct an array from a single element.
singleton :: forall a da. Patch a da => Jet a -> Jet (SnocArray a)
singleton { position, velocity } =
  { position: wrap [position]
  , velocity: toChange [ModifyAt 0 (fromChange velocity)]
  }

-- | Modify each array element by applying the specified function.
map
  :: forall a b da db
   . Patch a da
  => Patch b db
  => (Jet a -> Jet b)
  -> Jet (SnocArray a)
  -> Jet (SnocArray b)
map f { position: SnocArray xs, velocity: dxs } =
    { position: SnocArray (Prelude.map (_.position <<< f <<< constant) xs)
    , velocity: toChange (zipWith go xs (fromChange dxs))
    }
  where
    go _ (Snoc a) = Snoc (f (constant a)).position
    go _ Unsnoc = Unsnoc
    go a (ModifyAt i da) = ModifyAt i (fromChange j.velocity) where j = f { position: a, velocity: toChange da }

length
  :: forall a da
   . Patch a da
  => Jet (SnocArray a)
  -> Jet (WrappedEq Int)
length { position, velocity } =
    { position: wrap (Array.length (unwrap position))
    , velocity: toChange (additiveToLast (foldMap go (fromChange velocity)))
    }
  where
    go (Snoc _) = Additive 1
    go Unsnoc = Additive (-1)
    go _ = mempty

    additiveToLast (Additive 0) = mempty
    additiveToLast (Additive n) = Last (Just (Array.length (unwrap position) + n))
