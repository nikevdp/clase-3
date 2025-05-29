'''
Introducción a la Programación 1C2025
Práctica 6: Testing en Python 
'''

def suma(a: int, b: int) -> int:
    res: int = a + b
    return res

def volumen_esfera(radio: float) -> float:
    # Aproximamos pi a 3,14
    res: float = 4/3 * 3.14 * radio**3
    return res

def triada_pitagorica(a: int, b: int, c: int) -> bool:
    suma: int = a**2 + b**2
    res: bool = suma == c**2
    return res

# EJERCICIO 1
def es_multiplo_de(n: int, m: int) -> bool:
    if n % m == 0:
        res: bool = True
    else:
        res: bool = False
    return res

def devolver_el_doble_si_es_par(n: int) -> int:
    if es_multiplo_de(n,2):
        res: int = 2*n
    else:
        res: int = n
    return res

def fahrenheit_a_celsius(t: float) -> float:
    res: float = (t - 32) / 1.8
    return res

# EJERCICIO 2
def es_primo (n: int) -> bool:
    # COMPLETAR
    i:int=2
    if(n>1):
        while(n!=i):
            if(n%i == 0):
                return False
            else:
                i=i+1
        return True
    else:
        return False
# EJERCICIO 3
def cuantos_primos_en_rango(m: int, n: int) -> int:
    # COMPLETAR
    res: int = 0
    if (m<=n):
        for i in range(m-1, n+1, 1):
            if (es_primo(i)):
                res= res+1
    else:
        for i in range(n-1, m+1, 1):
            if (es_primo(i)):
                res= res+1
        
    return res



print(cuantos_primos_en_rango(11,11))