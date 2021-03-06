import Data.Productors
import Data.Productors.Instances
import Data.Functor.Identity


test1 :: Int -> Identity Int
test1 x = Identity (x + 1)

test2 :: Int -> Maybe Int
test2 = Just

test :: Int -> Maybe Int
test = test1 >==> test2

main :: IO ()
main = putStrLn $ "Test 3: " ++ show (test 3)
