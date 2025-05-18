'''
Introducción a la Programación 1C2025
Práctica 6: Testing en Python 
'''
import unittest
from guia6 import suma, triada_pitagorica, volumen_esfera, es_multiplo_de, devolver_el_doble_si_es_par, fahrenheit_a_celsius, es_primo, cuantos_primos_en_rango

# PARTE 1
class TestSuma(unittest.TestCase):

    def test_suma_positiva(self):
        self.assertEqual(suma(2, 3), 5)

    def test_suma_negativos(self):
        self.assertEqual(suma(-3,-2),-5)

# PARTE 2
 
class TestTriadaPitagorica(unittest.TestCase):

    def test_triada_verdadera_correcta(self):
        self.assertTrue(triada_pitagorica(3,4,5))

    def test_triada_falsa(self):
        self.assertFalse(triada_pitagorica(1,7,9))

    def test_triada_ok_desordenada(self):
        self.assertFalse(triada_pitagorica(5,4,3))

# PARTE 3

class test_volumen(unittest.TestCase):

    def test_volumen_1(self):
        resultado_esperado: float = 4.1867
        resultado_obtenido: float = volumen_esfera(1.0)
        self.assertAlmostEqual(resultado_obtenido, resultado_esperado, places=4)

    def test_volumen_nulo(self):
        self.assertAlmostEqual(volumen_esfera(0.0), 0.0, places=1)

    def test_volumen_5_25(self):
        self.assertAlmostEqual(volumen_esfera(5.25), 605.82375, places=5)

# PARTE 4

# EJERCICIO 1

class test_es_multiplo_de(unittest.TestCase):
    def test_es_multiplo_de_iguales(self):
        self.assertTrue(es_multiplo_de(2,2))
    def test_es_multiplo_de_true(self):
        self.assertTrue(es_multiplo_de(4,2))
    def test_es_multiplo_de_false(self):
        self.assertFalse(es_multiplo_de(7,2))

# COMPLETAR: Test de devolver_el_doble_si_es_par

class test_devolver_el_doble_si_es_par(unittest.TestCase):
    def test_devolver_el_doble_si_es_par_iguales(self):
        self.assertEqual(devolver_el_doble_si_es_par(2), 4)
    def test_devolver_el_doble_si_es_par_imopar(self):
        self.assertEqual(devolver_el_doble_si_es_par(7), 7)



# COMPLETAR: Test de fahrenheit_a_celsius

class test_fahrenheit_a_celsius(unittest.TestCase):
    def test_fahrenheit_a_celsius_1(self):
        self.assertEqual(fahrenheit_a_celsius(32.0), 0)
    def test_fahrenheit_a_celsius_2(self):
        self.assertAlmostEqual(fahrenheit_a_celsius(0), -17.778, places=3)
    

class test_es_primo(unittest.TestCase):
    def test_es_primo_true(self):
        self.assertTrue(es_primo(3))
    def test_es_primo_false(self):
        self.assertFalse(es_primo(4))
    def test_es_primo_negativo(self):
        self.assertFalse(es_primo(-4))

class test_cuantos_primos_en_rango(unittest.TestCase):
    def test_cuantos_primos_en_rango(self):
        self.assertEqual(cuantos_primos_en_rango(-3, 4), 2)
    def test_cuantos_primos_en_rango2(self):
        self.assertEqual(cuantos_primos_en_rango(11, 11) , 1)
    def test_cuantos_primos_en_rango3(self):
        self.assertEqual(cuantos_primos_en_rango(8, 2) , 4)
    
# EJERCICIO 2


# EJERCICIO 3
# COMPLETAR: Test de cuantos_primos_en_rango

if __name__ == '__main__':
    unittest.main(verbosity=2)