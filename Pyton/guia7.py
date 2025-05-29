from typing import List, Dict, Tuple 
from queue import LifoQueue as Pila, Queue as Cola

import random

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

"""
problema ordenados (in s:seq⟨Z⟩) : Bool {
requiere: { T rue }
asegura: { res = true ↔(para todo i ∈ Z si 0 ≤ i < (|s| − 1) → s[i] < s[i + 1] }
}
"""
def ordenados(s:list[int])->bool:
    for v in range(len(s)-1):
        if(s[v] > s[v+1]):
            return False
    return True
    
"""
def columnas_ordenadas(m:list[list[int]]):
    res: list[int] = []
    for l in m:
        for i in l:
            res.append([l[i]])
    return res
    
"""



"""
Implementar una funci´on
generar nros al azar(in cantidad : int, in desde : int,
in hasta : int) → Pila[int].
Pueden usar la funci´on random.randint(< desde >, < hasta >)
y la clase LifoQueue() que es un ejemplo de una implementaci´on
b´asica:
"""
 
def generar_numeros_al_azar(cantidad:int, desde:int, hasta:int)->Pila[int]:
    res:Pila[int]=Pila()
    for i in range(cantidad):
        res.put(random.randint(desde,hasta))
    return res


"""
problema buscar el maximo (in p : P ila[Z]) : Z {
requiere: {p no est´a vac´ıa}
asegura: {resultado es un elemento de p}
asegura: {resultado es mayor o igual a todos los elementos de
p}
}
"""

def buscar_el_maximo(p:Pila[int])->int:
    res:int= p.get()
    lista:list[int]=[]
    tamañoPila:int = p.qsize()
    for i in range(tamañoPila):
        lista.append(p.get())
    for i in lista:
        if(lista[i]>res):
            res=lista[i]
    for i in lista:
        p.put(lista[i])
    print(lista)
    return res

buscar_el_maximo(Pila([1,2,3,4,5]) )

"""
problema armar secuencia de bingo () : Cola[Z] {
requiere: {True}
asegura: {resultado solo contiene 100 n´umeros del 0 al 99
inclusive, sin repetidos}
asegura: {Los n´umeros de resultado est´an ordenados al azar}
}
"""
def incluye_en_lista(l:list[int], n:int)->bool:
    for i in l:
        if(l[i]==n):
            return False
    return True

def armar_secuencia_de_bingo () -> Cola[int]:
    res:Cola[int] = []
    lista: list[int] = []
    while (len(lista) == 100):
        numero:int = random.randint(0,99)
        if(incluye_en_lista)
        lista.append(random.randint(0,99))

def armar_secuencia_de_bingo2 () -> Cola[int]:
    bolillero:Cola[int] = Cola()
    lista: list[int] = range(100)
    random.shuffle(list)
    for bolilla in lista:
        bolillero.put(bolilla)
    return bolillero

def jugar_carton_de_bingo(carton:list[int], bolillero:Cola[int])->int:
    res:int = 0
    numerosSalidos:list[int] = []
    while (numerosSalidos == carton):
        bola:int = bolillero.get()
        for i in 
        if(bola)

