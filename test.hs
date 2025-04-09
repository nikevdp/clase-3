doubleMe x = x+x
-- ej 1
f x
  | x == 1  = 8
  | x == 4  = 131
  | x == 16 = 16

g x
  | x == 8  = 16
  | x == 16  = 4
  | x == 131 = 1

h x = f (g x) 
k x = g (f x)

-- ej 2

{-  
problema absoluto (x:Z) Z {
requiere: {true}
asegura: {x < 0 <-> res = (-x)} }
 -}

absoluto :: Int -> Int
absoluto x 
    | x >= 0 = x
    | otherwise = -x

{-  
problema maximoAboluto (x:Z y:Z) Z {
requiere: {true}
asegura: {|x| <= |y| <-> res = |y|}  }
asegura: {|x| > |y| <-> res = |x|}  }
 -}

maximoAbsoluto :: Int -> Int -> Int
maximoAbsoluto x y 
    | absoluto x > absoluto y = absoluto x
    | otherwise = absoluto y

{-  
problema maximoAboluto (x:Z y:Z) Z {
requiere: {true}
asegura: {|x| <= |y| <-> res = |y|}  }
asegura: {|x| > |y| <-> res = |x|}  }
 -}

maximo3 :: Int -> Int -> Int -> Int
maximo3 x y z
  | x >= y && x >= z = x
  | y >= x && y >= z = y
  | otherwise        = z

-- ej 3

{-
problema estanRelacionados (a : Z, b : Z) : Bool {
  requiere: {a ̸= 0 ∧ b ̸= 0}
  asegura: {(res = true) ↔ (a ∗ a + a ∗ b ∗ k = 0 para alg´un k ∈ Z con k ̸= 0)}
}
-}
 
estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados x y
  | mod (-x^2) (x * y) == 0 = True
  | otherwise = False


-- ej 4
productoInterno :: (Float, Float) -> (Float, Float) -> Float
productoInterno (x1, y1) (x2, y2) = x1 * x2 + y1 * y2

esParMenor :: (Float, Float) -> (Float, Float) -> Bool
esParMenor (x1, y1) (x2, y2) 
  | x1 < x2 && y1 < y2 = True
  | otherwise = False

distancia :: (Float, Float) -> (Float, Float) -> Float
distancia (x1, y1) (x2, y2) = sqrt ((x2 - x1)^2 + (y2 - y1)^2)

sumarSoloMultiplos :: (Integer, Integer, Integer) -> Integer -> Integer
sumarSoloMultiplos (x, y, z) j = esMultiplo x j * x + esMultiplo y j * y + esMultiplo z j * z
  where
    esMultiplo a b
      | mod a b == 0 = 1
      | otherwise    = 0

posPrimerPar :: (Int, Int, Int)  -> Int 
posPrimerPar (x, y, z) 
  | mod x 2 == 0 = x
  | mod y 2 == 0 = y
  | mod z 2 == 0 = z
  |otherwise = 4

bisiesto :: Int -> Bool
bisiesto x
 | mod x 400 == 0 = True
 | mod x 100 == 0 = False
 | mod x 4 == 0   = True
 | otherwise = False



{-problema distanciaManhattan (p: R × R × R, q: R × R × R) : R {
requiere: {True}
asegura: {res = ∑ (de i=0 a 2) |pi − qi|}
-}

type Coordenada3d = (Float, Float, Float)

distanciaManhattan :: Coordenada3d -> Coordenada3d -> Float
distanciaManhattan (x1, y1, z1) (x2, y2, z2) = abs(x1 - x2) + abs(y1 - y2) + abs(z1 - z2)

{-Implementar una funci´on comparar :: Integer -> Integer ->
Integer
problema comparar (a:Z, b:Z) : Z {
requiere: {True}
asegura: {(res= 1 ↔ sumaUltimosDosDigitos(a) <
sumaUltimosDosDigitos(b))}
asegura: {(res=-1 ↔ sumaUltimosDosDigitos(a) >
sumaUltimosDosDigitos(b))}
asegura: {(res= 0 ↔ sumaUltimosDosDigitos(a) =
sumaUltimosDosDigitos(b))}
}-}

sumaUltimosDosDigitos :: Integer -> Integer
sumaUltimosDosDigitos x = mod x 10 + mod (div x 10) 10

comparar :: Integer -> Integer -> Integer
comparar a b
  | sumaUltimosDosDigitos a < sumaUltimosDosDigitos b  = 1
  | sumaUltimosDosDigitos a > sumaUltimosDosDigitos b  = (-1)
  | otherwise = 0