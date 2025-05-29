import math

def print_hola_mundo () :
    print('hola')

def es_multiplo_de(n:int, m:int)->bool :
    res:int = m%n == 0
    return res

#print(es_multiplo_de(3,6))

def es_nombre_largo(nombre:str)->bool:
    res:bool= len(nombre) >= 3 and len(nombre) <= 8
    return res

#print(es_nombre_largo('123'))

def  pares_entre_10_y_40()->int:
    for i in range(10, 41, 2):
        print (i)

def cuenta_regresiva(n:int)->int:
    for i in range(n, 0, -1):
        print(i)
    print('despegue')

cuenta_regresiva(5)

# ej 8
def sumas()->int:
    x:int=5
    y:int=7