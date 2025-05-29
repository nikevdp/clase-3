import os
"""problema calcular promedio por estudiante (in notas:
seq⟨seq⟨Char⟩ × R⟩) : Diccionario ⟨ seq⟨Char⟩, R⟩ {
requiere: {El primer componente de las tuplas de notas no es
una cadena vac´ıa}
requiere: {El segundo componente de las tuplas de notas est´a
en el rango [0, 10]}
asegura: {Todas las claves de res son nombres que aparecen
en notas (primer componente)}
asegura: {Todos los nombres de notas (primer componente)
son clave en res}
asegura: {El valor de cada clave de res es el promedio de
todas las notas que obtuvo el estudiante (segunda
componente de notas)}
}"""
def calcular_promedio_por_estudiante(notas:list[list[str],float])-> dict[list[str],float]:
    res:dict = {}
    nombresUsados:list[list[str]]=[]
    for e in notas:
        if not e[0] in nombresUsados:
            nombresUsados.append(e[0])
            notaTotal:list[list[str],float,float]=[e[0],0,0]
            for n in notas:
                if n[0] == e[0]:
                    notaTotal[1] += n[1]
                    notaTotal[2] += 1
            promedio:int = notaTotal[1] / notaTotal[2]     
            res[e[0]] = promedio

    return res
        

"""problema contar lineas (in nombre archivo: seq⟨Char⟩) : Z {
requiere: {nombre archivo es el path con el nombre de un
archivo existente y accesible}
asegura: {res es igual a la cantidad de l´ıneas que contiene el
archivo indicado por nombre archivo}
}"""

def contar_lineas (nombre_archivo: list[str]) ->int:
    archivo = open(nombre_archivo, "r").read()
    res:int = 0
    if len(archivo) == 0:
        res = 0
    else:
        res = 1
        for i in archivo:
            if i == '\n':
                res += 1
    return res
    

contar_lineas('./lineas.txt')