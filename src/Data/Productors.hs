{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FunctionalDependencies #-}
module Data.Productors where

  class Functor f => Effect f where
    eta :: a -> f a

  class (Effect f, Effect g) => EffectorLT f g where
    liftEff :: (f a) -> (g a)

  class (Effect f, Effect g, Effect h) => EffectorM f g h | f g -> h where
    multEff :: f (g a) -> h a


  (>==>) :: EffectorM m1 m2 m => (a -> m1 b) -> (b -> m2 c) -> a -> m c
  (>==>) f g x = multEff (fmap g (f x))

  (>>==) :: EffectorM m1 m2 m => m1 a -> (a -> m2 b) -> m b
  x >>== f = multEff (fmap f x)
  
