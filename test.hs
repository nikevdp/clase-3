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