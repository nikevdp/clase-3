'''
Introducción a la Programación 1C2025
Práctica 7: Testing en Python 
'''
import unittest
from guia7 import pertenece, pertenece2, generar_numeros_al_azar, buscar_el_maximo
from queue import LifoQueue as Pila

# PARTE 1
class TestPertenece(unittest.TestCase):

    def test_pertenece_vacio(self):
        self.assertFalse(pertenece([], 3))

    def test_pertenece_uno(self):
        self.assertTrue(pertenece([3], 3))

    def test_pertenece_true(self):
        self.assertTrue(pertenece([1, 2, 3, 4], 3))
    
    def test_pertenece_false(self):
        self.assertFalse(pertenece([1, 2, 3, 4], 6))

class TestPertenece2(unittest.TestCase):

    def test_pertenece2_vacio(self):
        self.assertFalse(pertenece2([], 3))

    def test_pertenece2_uno(self):
        self.assertTrue(pertenece2([3], 3))

    def test_pertenece2_true(self):
        self.assertTrue(pertenece2([1, 2, 3, 4], 3))
    
    def test_pertenece2_false(self):
        self.assertFalse(pertenece2([1, 2, 3, 4], 6))

class Testgenerar_numeros_al_azar(unittest.TestCase):

    def test_1(self):

        pila = generar_numeros_al_azar(10, 10, 40)
        while not pila.empty():
            numero= pila.get()
            self.assertIn(numero, range(10, 41))

class Testgenerar_buscar_el_maximo(unittest.TestCase):

    def test_1(self):
        pila = buscar_el_maximo(generar_numeros_al_azar(10, 10, 40))
        while not pila.empty():
            numero= pila.get()
            self.assertIn(numero, range(10, 41))


if __name__ == '__main__':
    unittest.main(verbosity=2)