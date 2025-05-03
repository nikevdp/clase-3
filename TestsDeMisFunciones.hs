module TestsDeMisFunciones where

import Test.HUnit
import Data.List (sort)
import MisFunciones
import EjemploParcial
tablero = [[13, 12, 6, 4],[1, 1, 32, 25],[9, 2, 14, 7],[7, 3, 5, 16],[27, 2, 8, 18]]

-- Usá esta función para comparar listas sin importar el orden
assertEqualUnordered :: (Eq a, Ord a, Show a) => String -> [a] -> [a] -> Assertion
assertEqualUnordered msg expected actual =
    assertEqual msg (sort expected) (sort actual)

runFibo = runTestTT testsFibo

testsFibo = test[
    "Caso base 1: fibonacci 0" ~: (fibonacci 0) ~?= 0,
    "Caso base 2: fibonacci 1" ~: (fibonacci 1) ~?= 1,
    "Caso recursivo 1: fibonacci 2" ~: (fibonacci 2) ~?= 2]

runStock = runTestTT testsStock

testsStock = test [
    "lista vacia" ~: assertEqualUnordered "lista vacía" [] (generarStock []),
    "un elemento" ~: assertEqualUnordered "un elemento" [("clavo",1)] (generarStock ["clavo"]),
    "Muchos elementos distintos" ~: assertEqualUnordered "distintos" [("clavo",1),("tuerca",1),("madera",1)] (generarStock ["clavo","madera","tuerca"]),
    "Muchos elementos iguales" ~: assertEqualUnordered "iguales" [("clavo",3)] (generarStock ["clavo","clavo","clavo"]),
    "varios con repeticiones ordenado" ~: assertEqualUnordered "ordenado" [("clavo",3),("madera",2),("tuerca",1)] (generarStock ["clavo","clavo","clavo","madera","madera","tuerca"]),
    "varios con repeticiones desordenado" ~: assertEqualUnordered "desordenado" [("clavo",3),("madera",2),("tuerca",2)] (generarStock ["clavo","madera","clavo","tuerca","tuerca","clavo","madera"])
    ]

runDineroEnStock = runTestTT testsDineroEnStock

testsDineroEnStock = test [
    "lista vacia" ~: (dineroEnStock [] [("clavo",2.5)]) ~?= 0,
    "un elemento" ~:(dineroEnStock [("clavo",1)] [("clavo",2.5)]) ~?= 2.5,
    "Muchos elementos distintos" ~: (dineroEnStock [("clavo",3),("madera",2),("tuerca",2)] [("clavo",2.5),("madera",3),("tuerca",1)]) ~?= 15.5,
    "Muchos elementos iguales" ~: (dineroEnStock [("clavo",3),("madera",2),("tuerca",2)] [("madera",3),("tuerca",1),("clavo",2.5)]) ~?= 15.5]

runTestsAplicarOferta = runTestTT testsAplicarOferta

testsAplicarOferta = test [
    "lista vacia" ~: (aplicarOferta [] [("clavo",100)]) ~?= [],
    "un elemento" ~:(aplicarOferta [("clavo",10)] [("clavo",100)]) ~?= [("clavo",80)],
    "un elemento menso de 10" ~:(aplicarOferta [("clavo",9)] [("clavo",100)]) ~?= [("clavo",100)],
    "Muchos elementos distintos" ~: (aplicarOferta [("clavo",10),("madera",11),("tuerca",5)] [("clavo",100),("madera",200),("tuerca",300)]) ~?= [("clavo",80),("madera",160),("tuerca",300)],
    "Muchos elementos iguales" ~: (aplicarOferta [("clavo",30),("madera",25),("tuerca",60)] [("madera",200),("tuerca",300),("clavo",100)]) ~?= [("clavo",80),("madera",160),("tuerca",240)]]

runTestsmasRepetido = runTestTT testsmasRepetido

testsmasRepetido = test [
    "un elemento" ~:(masRepetido [[13]]) ~?= 13,
    "un elemento menso de 10" ~:(masRepetido tablero) ~?= 1,
    "Muchos elementos distintos" ~: (masRepetido [[13, 12, 6, 4],[1, 1, 12, 25],[9, 2, 14, 7],[7, 3, 12, 16],[27, 2, 8, 12]]) ~?= 12,
    "Muchos elementos iguales" ~: (masRepetido [[1, 1, 1, 1],[1, 1, 32, 25]]) ~?= 1]


runTestsvaloresDeCamino = runTestTT testsvaloresDeCamino


-- [[13, 12, 6, 4],[1, 1, 32, 25],[9, 2, 14, 7],[7, 3, 5, 16],[27, 2, 8, 18]]
testsvaloresDeCamino = test [
    "un elemento" ~:(valoresDeCamino tablero [(1,3), (1,4), (2,4),(3,4)]) ~?= [6,4,25,7],
    "un elemento menso de 10" ~:(valoresDeCamino tablero [(1,3)]) ~?= [6],
    "Muchos elementos distintos" ~: (valoresDeCamino tablero [(1,3),(1,4),(2,4),(3,4)]) ~?= [6,4,25,7],
    "Muchos elementos iguales" ~: (valoresDeCamino tablero[(1,3), (1,4), (2,4),(3,4)]) ~?= [6,4,25,7]]