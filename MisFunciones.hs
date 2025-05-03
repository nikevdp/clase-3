module MisFunciones where

fibonacci :: Int->Int
fibonacci x
  | x == 0 || x == 1 = x
  | otherwise = fibonacci(x - 1) + fibonacci(x - 1)
