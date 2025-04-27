-- ej 14

sumaPotencias :: Int -> Int -> Int -> Int
sumaPotencias q n m 
    | n == 1 && m == 1 = q*q
    | m > 1 && n == 1 = q^(n+m) + sumaPotencias q n (m-1)
    |otherwise = sumaPotenciasM q n m + sumaPotencias q (n-1) m

sumaPotenciasM :: Int -> Int -> Int -> Int
sumaPotenciasM q n m
    | m == 1 = q^(n+m)
    | otherwise = q^(n+m) + sumaPotenciasM q n (m-1)

-- ej 16
menorDivisor :: Int -> Int
menorDivisor x 
    | mod x 2 == 0 = 2
    | otherwise = buscarDivisor x 2

buscarDivisor :: Int -> Int -> Int
buscarDivisor x i
    | mod x i == 0 = i
    | otherwise = buscarDivisor x (i+1)
-- ej 16 d
nEsimoPrimo :: Int -> Int
nEsimoPrimo x
    | x == 1 = 2
    |otherwise = buscarPrimos x 1 2

buscarPrimos :: Int->Int->Int->Int
buscarPrimos x i primo
    | i == x = primo
    | otherwise = buscarPrimos x (i+1) (siguientePrimo (primo + 1))

esPrimo :: Int -> Int -> Bool
esPrimo x i
    | x == i = True
    | mod x i == 0 = False
    | otherwise = esPrimo x (i+1)

siguientePrimo :: Int -> Int
siguientePrimo x
    | esPrimo x 2 = x
    | otherwise = siguientePrimo (x+1)

-- ej 19
esSumaInicialDePrimos :: Int -> Bool
esSumaInicialDePrimos x
    | x == 1 = False
    | otherwise = consecucionDePrimosSumados x 0 1

consecucionDePrimosSumados :: Int -> Int -> Int -> Bool
consecucionDePrimosSumados x acumulado i
    | x == acumulado = True
    | acumulado > x = False
    | otherwise = consecucionDePrimosSumados x (acumulado + nEsimoPrimo i) (i+1)

primosSumadosHasta :: Int -> Int
primosSumadosHasta x
    | x == 0 = 0
    | otherwise = nEsimoPrimo x + primosSumadosHasta (x-1)


