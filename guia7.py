from typing import List, Dict, Tuple 

"""

1. problema pertenece (in s:seq⟨Z⟩, in e: Z) : Bool {
requiere: { T rue }
asegura: { (res = true) ↔(existe un i ∈ Z tal que 0 ≤ i < |s| ∧ s[i] = e) }
}

"""
def pertenece(s:List[int], e:int)->bool:
    for i in range(len(s)):
        if (s[i] == e):
            return True
    return False

def pertenece2(s:List[int], e:int)->bool:
    i:int=0
    while i < len(s):
        if (s[i] == e):
            return True
        i=i+1
    return False


pertenece([1,3,4,5,6,7,8], 10)
pertenece2([1,3,4,0,6,7,8], 0)


"""
divide a todos (in s:seq⟨Z⟩, in e: Z) : Bool {
requiere: { e ̸= 0 }
asegura: { (res = true) ↔ (para todo i ∈ Z si 0 ≤ i < |s| → s[i] mod e = 0) }
}
"""

def divide_a_todos(s:List[int], e:int)-> bool:
    for i in range(len(s)):
        if s[i]%e !=0:
            return False
    return True

divide_a_todos([2,4,6,8,10], 3)

"""
Dada una lista de palabras (seq⟨seq⟨Char⟩⟩), devolver verdadero si alguna palabra tiene longitud mayor a 7. Ejemplo:
[“termo”, “gato”, “tener”, “jirafas”], devuelve falso.
problema long mayorASiete (in s:seq⟨seq⟨Char⟩⟩) : Bool {
requiere: { T rue }
asegura: { (res = true) ↔ (existe i ∈ Z tal que (0 ≤ i < (|s| − 1)) y (|s[i]| > 7) }
}
"""
def long_mayorASiete ( s:List[List[str]]) -> bool:
    for i in range(len(s)):
        if len(s[i]) > 7:
            return True
    return False

long_mayorASiete(["termo", "gato", "tener", "jirafass"])


"""
14. Cantidad de d´ıgitos impares.
problema cantidad digitos impares (in s:seq⟨Z⟩) : Z {
requiere: { Todos los elementos de n´umeros son mayores o iguales a 0 }
asegura: { res es la cantidad total de d´ıgitos impares que aparecen en cada uno de los elementos de n´umeros }
}
Por ejemplo, si la lista de n´umeros es [57, 2383, 812, 246], entonces el resultado esperado ser´ıa 5 (los d´ıgitos impares
son 5, 7, 3, 3 y 1).
"""

def digitos_impares(n:int)-> int:
    numero:int=n
    res:int=0
    while numero != 0:
        print(numero)
        if (numero%10)%2 != 0:
            res = res + 1
        numero = numero // 10
    return res

def cantidad_digitos_impares(s:List[int])-> int:
    res:int=0
    for i in range(len(s)):
        res=res+digitos_impares(s[i])
    return res




