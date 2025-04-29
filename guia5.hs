-- guia 5

longitud :: [Int]->Int

longitud [] = 0
longitud (_:xs) = 1 + longitud xs

sumatoria :: [Int]->Int
sumatoria [] = 0
sumatoria (x:xs) = sumatoria xs + x

pertenece :: Int->[Int]->Bool
pertenece y t 
  | t == [] = False
  | head t == y = True
  | otherwise = pertenece y (tail t)

pertenece2 :: Int->[Int]->Bool
pertenece2 y [] = False
pertenece2 y (x:xs) 
  | x == y = True
  | otherwise = pertenece y xs

sacarBlancosRepetidos :: [Char]->[Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos [x] = [x]

contarPalabras :: [Char]->Integer
contarPalabras [] = 0
contarPalabras [x] = 1
contarPalabras (x:y:xs)
  | xs == [] = 0
  | x /= ' ' && y /= ' ' = contarPalabras xs + 1
  | otherwise = contarPalabras xs 

quitar :: (Eq t) => t -> [t] -> [t]
quitar e [] = []
quitar e (x:xs)     | e == x = xs
                    | otherwise = x:quitar e xs

maximo :: [Int] -> Int
maximo [x] = x
maximo (x:xs)   | x > head(xs) = maximo(x:tail(xs)) 
                | otherwise = maximo(xs)

maximo2 :: [Int] -> Int
maximo2 [x] = x
maximo2 (x:y:xs)    | x > y = maximo(x:xs) 
                    | otherwise = maximo(y:xs)

ordenar :: [Int] -> [Int]
ordenar [] = []
ordenar x = ordenar (quitar (maximo x) x) ++ [maximo x]

enLosContactos :: Char -> [(Float,Float)] -> Bool
enLosContactos n [] = False
enLosContactos n ((n1,t1):xs)   | n == n1 = True
                                | otherwise = enLosContactos n xs
