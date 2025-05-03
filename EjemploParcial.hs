module EjemploParcial where
{-Ejercicio 1. Implementar la funci´on generarStock :: [String] ->[(String, Int)]
problema generarStock (mercader´ıa: seq⟨String⟩) : seq⟨String × Z⟩ {
requiere: {True}
asegura: { La longitud de res es igual a la cantidad de productos distintos que hay en mercader´ıa}
asegura: {Para cada producto que pertenece a mercader´ıa, existe un i tal que 0 ≤ i < |res| y res[i]0=producto y
res[i]1 es igual a la cantidad de veces que aparece producto en mercader´ıa}
}
-}
--ej 1

generarStock :: [String] -> [(String, Int)]
generarStock [] = []
generarStock (x:xs) | otherwise = [(x, (contarProductos xs x 1))] ++ generarStock (eliminarProductoContado xs x)

contarProductos :: [String] -> String -> Int -> Int
contarProductos [] producto i = i
contarProductos (x:xs) producto i | producto == x = contarProductos xs producto (i+1)
                                  | otherwise = contarProductos xs producto i

eliminarProductoContado :: [String] -> String -> [String]
eliminarProductoContado [] productoEliminado = []
eliminarProductoContado (x:xs) productoEliminado | productoEliminado == x = eliminarProductoContado xs productoEliminado
                                                 | otherwise = eliminarProductoContado xs productoEliminado ++ [x]

{-Ejercicio 2. Implementar la funci´on stockDeProducto :: [(String, Int))] ->String
problema stockDeProducto (stock: seq⟨String × Z⟩, producto: String ) : Z {
requiere: {No existen dos nombres de productos (primeras componentes) iguales en stock}
requiere: {Todas las cantidades (segundas componentes) de stock son mayores a cero}
asegura: {si no existe un i tal que 0 ≤ i < |stock| y producto = stock[i]0 entonces res es igual a 0 }
asegura: {si existe un i tal que 0 ≤ i < |stock| y producto = stock[i]0 entonces res es igual a stock[i]1 }
}-}
-- ej 2

stockDeProducto :: [(String, Int)] ->String -> Int
stockDeProducto [] producto = 0
stockDeProducto (x:xs) producto | producto == fst x = snd x
                                | otherwise = stockDeProducto xs producto

{-Ejercicio 3. Implementar la funci´on dineroEnStock :: [(String, Int))] ->[(String, Float)] ->Float
problema dineroEnStock (stock: seq⟨String × Z⟩, precios: seq⟨String × R⟩ ) : R {
requiere: {No existen dos nombres de productos (primeras componentes) iguales en stock}
requiere: {No existen dos nombres de productos (primeras componentes) iguales en precios}
requiere: {Todas las cantidades (segundas componentes) de stock son mayores a cero}
requiere: {Todos los precios (segundas componentes) de precios son mayores a cero}
requiere: {Todo producto de stock aparece en la lista de precios}
asegura: {res es igual a la suma de los precios de todos los productos que est´an en stock multiplicado por la cantidad
de cada producto que hay en stock}
}-}
--ej 3
dineroEnStock :: [(String, Int)] ->[(String, Float)] ->Float
dineroEnStock [] listaPrecios = 0
dineroEnStock (x:xs) listaPrecios = dinerPorProducto [x] listaPrecios + dineroEnStock xs listaPrecios

dinerPorProducto :: [(String, Int)] ->[(String, Float)] ->Float
dinerPorProducto [] (x:xs) = 0
dinerPorProducto [(producto, cantidad)] (x:xs) | producto == fst x = (snd x) * (fromIntegral cantidad)
                                               | otherwise = dinerPorProducto [(producto, cantidad)] xs

{-Ejercicio 4. Implementar la funci´on aplicarOferta :: [(String, Int)] ->[(String, Float)] ->[(String,Float)]
problema aplicarOferta (stock: seq⟨String × Z⟩, precios: seq⟨String × R⟩ ) : seq⟨String × R⟩ {
requiere: {No existen dos nombres de productos (primeras componentes) iguales en stock}
requiere: {No existen dos nombres de productos (primeras componentes) iguales en precios}
requiere: {Todas las cantidades (segundas componentes) de stock son mayores a cero}
requiere: {Todos los precios (segundas componentes) de precios son mayores a cero}
requiere: {Todo producto de stock aparece en la lista de precios}
asegura: {|res| = |precios|}
asegura: {Para todo 0 ≤ i < |precios|, si stockDeProducto(stock, precios[i]0) > 10, entonces res[i]0 = precios[i]0 y
res[i]1 = precios[i]1∗ 0,80}
asegura: {Para todo 0 ≤ i < |precios|, si stockDeProducto(stock, precios[i]0) ≤ 10, entonces res[i]0 = precios[i]0 y
res[i]1 = precios[i]1 }
}-}

aplicarOferta :: [(String, Int)] ->[(String, Float)] ->[(String,Float)]
aplicarOferta [] listaPrecios = []
aplicarOferta (x:xs) listaPrecios = aplicarOfertaPorProducto [x] listaPrecios ++ aplicarOferta xs listaPrecios


aplicarOfertaPorProducto :: [(String, Int)] ->[(String, Float)] ->[(String,Float)]
aplicarOfertaPorProducto [] (x:xs) = []
aplicarOfertaPorProducto [(producto, cantidad)] (x:xs)  | producto == (fst x) && cantidad >= 10 = [(producto,((snd x)*0.80))]
                                                        | producto == (fst x) && cantidad < 10 = [(producto,(snd x))]
                                                        | otherwise = aplicarOfertaPorProducto [(producto, cantidad)] xs



type Fila = [Int]
type Tablero = [Fila]
type Posicion = (Int, Int) -- Observacion: las posiciones son: (fila, columna)
type Camino = [Posicion]

{-[[13, 12, 6, 4],[1, 1, 32, 25],[9, 2, 14, 7],[7, 3, 5, 16],[27, 2, 8, 18]]-}

{-Ejercicio 5. Implementar la funci´on maximo :: Tablero ->Int
problema maximo (t: Tablero) : Z {
requiere: {El tablero t es un tablero bien formado, es decir, la longitud de todas las filas es la misma, y tienen al
menos un elemento}
requiere: {Existe al menos una columna en el tablero t }
requiere: {El tablero t no es vac´ıo, todos los n´umeros del tablero son positivos, mayor estricto a 0}
asegura: {res es igual al n´umero m´as grande del tablero t}
}-}
maximo :: Tablero ->Int
maximo [] = 0
maximo [x] = maximoFilas x
maximo (x:y:xs) | maximoFilas x >= maximoFilas y = maximo (x:xs)
                | otherwise = maximo (y:xs)


maximoFilas :: Fila -> Int
maximoFilas [] = 0
maximoFilas [x] = x
maximoFilas (x:y:xs)    | x >= y = maximoFilas (x:xs)
                        | otherwise = maximoFilas (y:xs)

{-Ejercicio 6. Implementar la funci´on masRepetido :: Tablero ->Int
problema masRepetido (t: Tablero) : Z {
requiere: {El tablero t es un tablero bien formado, es decir, la longitud de todas las filas es la misma, y tienen al
menos un elemento}
requiere: {Existe al menos una columna en el tablero t }
requiere: {El tablero t no es vac´ıo, todos los n´umeros del tablero son positivos, mayor estricto a 0}
asegura: {res es igual al n´umero que m´as veces aparece en un tablero t. Si hay empate devuelve cualquiera de ellos}
}-}

masRepetido :: Tablero ->Int
masRepetido tablero = fst (buscarMasRepetido (armarObjetoTuplas (deTableroAFila tablero)))

deTableroAFila :: Tablero ->[Int]
deTableroAFila [] = []
deTableroAFila (x:xs) = x ++ deTableroAFila xs

canitdadApariciones :: [Int] -> Int -> Int -> (Int, Int)
canitdadApariciones [] numero i = (numero, i)
canitdadApariciones (x:xs) numero i | numero == x = canitdadApariciones xs numero (i+1)
                                    | otherwise = canitdadApariciones xs numero i

armarObjetoTuplas :: [Int] -> [(Int, Int)]
armarObjetoTuplas [] = []
armarObjetoTuplas (x:xs) = [canitdadApariciones (x:xs) x 0] ++ armarObjetoTuplas (sacarRepetido (x:xs) x)

buscarMasRepetido :: [(Int,Int)] -> (Int,Int)
buscarMasRepetido [(x,y)] = (x,y)
buscarMasRepetido (x:y:xs)  
                            | snd x >= snd y = buscarMasRepetido (x:xs)
                            | otherwise = buscarMasRepetido (y:xs)


sacarRepetido :: [Int] ->Int->[Int]
sacarRepetido [] numero = []
sacarRepetido (x:xs) numero | numero == x = sacarRepetido xs numero
                            | otherwise = x:(sacarRepetido xs numero)

{-Ejercicio 7. Implementar la funci´on valoresDeCamino :: Tablero ->Camino ->[Int]
problema valoresDeCamino (t: Tablero, c: Camino) : seq⟨Z⟩ {
requiere: {El tablero t es un tablero bien formado, es decir, la longitud de todas las filas es la misma, y tienen al
menos un elemento}
requiere: {Existe al menos una columna en el tablero t }
requiere: {El tablero t no es vac´ıo, todos los n´umeros del tablero son positivos, mayores estrictos a 0}
requiere: {El camino c es un camino v´alido, es decir, secuencia de posiciones adyacentes en la que solo es posible
desplazarse hacia la posici´on de la derecha o hacia abajo y todas las posiciones est´an dentro de los limites del tablero
t}
asegura: {res es igual a la secuencia de n´umeros que est´an en el camino c, ordenados de la misma forma que aparecen
las posiciones correspondientes en el camino.}
}-}

{-[[13, 12, 6, 4],[1, 1, 32, 25],[9, 2, 14, 7],[7, 3, 5, 16],[27, 2, 8, 18]]-}

valoresDeCamino :: Tablero ->Camino ->[Int]
valoresDeCamino tablero [] = []
valoresDeCamino tablero (x:xs) = [buscarPorCoordenada tablero x] ++ valoresDeCamino tablero xs

buscarPorCoordenada :: Tablero ->Posicion->Int
buscarPorCoordenada tablero (fila,columna) = buscarNumeroPorColumna (buscarNumeroPorFila tablero fila 1) columna 1

buscarNumeroPorFila :: Tablero -> Int -> Int ->[Int]
buscarNumeroPorFila (y:xs) x i  | x == i = y
                                | otherwise = buscarNumeroPorFila xs x (i+1)

buscarNumeroPorColumna :: Fila -> Int -> Int ->Int
buscarNumeroPorColumna (y:xs) x i   | x == i = y
                                    | otherwise = buscarNumeroPorColumna xs x (i+1)


{-Ejercicio 8. Implementar la funci´on esCaminoFibo :: [Int] ->Int ->Bool
problema esCaminoFibo (s:seq⟨Z⟩, i : Z) : Bool {
requiere: {La secuencia de n´umeros s es no vac´ıa y est´a compuesta por n´umeros positivos (mayores estrictos a 0)
que representan los n´umeros ubicados en las posiciones que forman un camino en un tablero}
requiere: {i ≥ 0}
asegura: {res = true ⇔ los valores de s son la sucesi´on de Fibonacci inicializada con el n´umero pasado como
par´ametro i}
}
Notas: En este ejercicio se pasa una secuencia de valores en lugar de un tablero y un camino para no generar dependencia
con el ejercicio anterior. Recordemos que la sucesi´on de Fibonacci est´a definida con la siguiente funci´on recursiva:
f(0) = 0
f(1) = 1
f(n) = f(n-1) + f(n-2) con n>1
En el ejemplo del tablero y del camino (verde claro) que figuran m´as arriba tenemos que esCaminoFibo [1,1,2,3,5] 1
reduce a True.
esCaminoFibo (valoresDeCamino tablero [(3,2), (4, 2), (4,3)]) 3, siendo tablero el del ejemplo, tambi´en reduce a
True.-}
fibonacci3 :: Int -> Int
fibonacci3(0) = 0
fibonacci3(1) = 1
fibonacci3(n) | n > 1 = fibonacci3(n-1) + fibonacci3(n-2)

esCaminoFibo :: [Int] ->Int ->Bool
esCaminoFibo [] numero = True
esCaminoFibo (x:xs) numero  | fibonacci3(numero) == x = esCaminoFibo xs (numero + 1)
                            | otherwise = False


{-Ejercicio 9. Implementar la funci´on divisoresPropios :: Int ->[Int]
problema divisoresPropios (n: Z) : seq⟨Z⟩ {
requiere: {n > 0}
asegura: {res contiene a todos los divisores propios de n, ordenados de menor a mayor}
asegura: {res no tiene elementos repetidos}
asegura: {res no contiene a ning´un elemento que no sea un divisor propio de n}
}-}


divisoresPropios :: Int ->[Int]
divisoresPropios 1 = []
divisoresPropios n = encontrarDivisoresPropios n 1

encontrarDivisoresPropios :: Int -> Int ->[Int]
encontrarDivisoresPropios n divisor | divisor == n = []
                                    | mod n divisor == 0 = divisor : encontrarDivisoresPropios n (divisor + 1)
                                    | otherwise = encontrarDivisoresPropios n (divisor + 1)

{-
Ejercicio 10. Implementar la funci´on sonAmigos :: Int ->Int ->Bool
problema sonAmigos (n,m: Z) : Bool {
requiere: {n > 0}
requiere: {m > 0}
requiere: {m ̸= n}
asegura: {res = True ⇔ n y m son n´umeros amigos}
}
-}
sonAmigos :: Int ->Int ->Bool
sonAmigos y x   | sumaDeDivisores (divisoresPropios x) == y && sumaDeDivisores (divisoresPropios y) == x = True
                | otherwise = False

sumaDeDivisores :: [Int] -> Int
sumaDeDivisores [] = 0
sumaDeDivisores [x] = x
sumaDeDivisores (x:y:xs) = x + y + sumaDeDivisores xs

{-Ejercicio 11. Implementar la funci´on losPrimerosNPerfectos :: Int ->[Int]
problema losPrimerosNPerfectos (n: Z) : seq⟨Z⟩ {
requiere: {n > 0}
asegura: {|res| = n}
asegura: {res es la lista de los primeros n n´umeros perfectos, de menor a mayor}
}
Por cuestiones de tiempos de ejecuci´on, no les recomendamos que prueben este ejercicio con un n > 4.
-}
losPrimerosNPerfectos :: Int ->[Int]
losPrimerosNPerfectos x = iterarNumerosPerfectos 2 x 0

iterarNumerosPerfectos :: Int -> Int -> Int -> [Int]
iterarNumerosPerfectos numero n i  | n == i = []
                                   | esNumeroPerfecto numero == False = iterarNumerosPerfectos (numero+1) n i
                                   | otherwise = [numero] ++ iterarNumerosPerfectos (numero+1) n (i+1)

esNumeroPerfecto :: Int -> Bool
esNumeroPerfecto n  | sumaDeDivisores (divisoresPropios n) == n = True
                    | otherwise = False

{-
Ejercicio 12. Implementar la funci´on listaDeAmigos :: [Int] ->[(Int,Int)]
problema listaDeAmigos (lista: seq⟨Z⟩) : seq⟨Z × Z⟩ {
requiere: {Todos los n´umeros de lista son mayores a 0}
requiere: {Todos los n´umeros de lista son distintos}
asegura: {res es una lista de tuplas sin repetidos, que contiene a todos los pares de n´umeros que pertenecen a lista
y son amigos entre s´ı}
asegura: {|res| es igual a la cantidad de pares de n´umeros amigos que hay en lista.}
}

-}
listaDeAmigos :: [Int] ->[(Int,Int)]
listaDeAmigos [] = []
listaDeAmigos (x:xs) = filtrarListaDeAmigos xs x ++ listaDeAmigos xs

filtrarListaDeAmigos :: [Int] -> Int -> [(Int,Int)]
filtrarListaDeAmigos [] n = []
filtrarListaDeAmigos (x:xs) n   | sonAmigos x n = [(x,n)]
                                | otherwise = filtrarListaDeAmigos xs n
