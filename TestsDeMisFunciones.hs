module TestsDeMisFunciones where

import Test.HUnit
import MisFunciones
import GuiaRepaso

runFibo = runTestTT testsFibo

testsFibo = test[
    "Caso base 1: fibonacci 0" ~: (fibonacci 0) ~?= 0,
    "Caso base 2: fibonacci 1" ~: (fibonacci 1) ~?= 1,
    "Caso recursivo 1: fibonacci 2" ~: (fibonacci 2) ~?= 2]

runStock = runTestTT testsStock

testsStock = test[
    "lista vacia" ~: (generarStock []) ~?= [],
    "un elemento" ~: (generarStock ["clavo"]) ~?= [("clavo",1)],
    "Muchos elemntos distintos" ~: (generarStock ["clavo","madera","tuerca"]) ~?= [("clavo",1),("tuerca",1),("madera",1)],
    "Muchos elemntos iguales" ~: (generarStock ["clavo","clavo","clavo"]) ~?= [("clavo",3)],
    "varios con repeticiones ordenado" ~: (generarStock ["clavo","clavo","clavo","madera","madera","tuerca"]) ~?= [("clavo",3),("madera",2),("tuerca",1)],
    "varios con repeticiones desordenado" ~: (generarStock ["clavo","madera","clavo","tuerca","tuerca","clavo","madera"]) ~?= [("clavo",3),("madera",2),("tuerca",1)]]
