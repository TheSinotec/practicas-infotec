"""
Archivo con las funciones solución a los ejercicios de la presentación

Autor: @TheSinotec
        -Jonatán Salgado Razo
"""

def area_triangulo():
    """
    Función que valida y calcula el área de un triángulo rectángulo, al recibir sus lados por teclado
    """
    print("Este algoritmo calcula el área de un triángulo rectángulo, introduciendo sus lados")
    try:
        lados = []
        lados.append(abs(float(input("Lado A:\n"))))
        lados.append(abs(float(input("Lado B:\n"))))
        lados.append(abs(float(input("Lado C:\n"))))
        lados.sort()
        if lados[-1]**2 == lados[0]**2 + lados[1]**2:
            print("El área del triángulo es: " + str(lados[0]*lados[1]/2))
        else:
            print("Tu triángulo no es rectángulo, intenta de nuevo")
    except ValueError:
        print("Intente de nuevo usando números")

def es_multiplo_seis():
    """
    Función que muestra en pantalla si un número dado por teclado es múltiplo de seis (adicionalmente se muestran sus factores)
    """
    try:
        n = int(input("Escriba un número:\n"))
        print("n = ", n, ", " + "NO "*bool(n%6) + "es múltiplo de 6")
        print(("n = 6*("+str(n//6)+")")*(not bool(n%6)))
    except ValueError:
        print("Se requieren números enteros, intente de nuevo")

def suma_tres_en_tres():
    """
    Función que muestra la serie de la sucesión {3, 6, 9, 12,..., 99}
    """
    print(sum([3*i for i in range(1,34)]))

def promedio_nm(n: int, m: int = 0):

    """
    Función que calcula el promedio de una N cantidad de alumnos con una M cantidad de materias (muestra en pantalla). Si no se agrega un valor para M, entonces M=N

    Parámetros:
        n - int. La cantidad de alumnos
        m - int. La cantidad de materias. Por defecto: 0
    """
    if n <= 0:
        print("Debe incertar un número de alumnos correcto, intente de nuevo")
        return None
    if m <= 0:
        m=n
    notas = [["0.0" for i in range(m+1)] for j in range(n)]
    for i in range(n):
        for j in range(m+1):
            if j==0:
                notas[i][j] = input("Ingrese nombre del alumno #" + str(i+1) + "\n")
            else:
                try:
                    notas[i][j] = float(input("Ingrese la calificación de la materia #" +str(j) + " del alumno " + notas[i][0] + "\n"))
                except ValueError:
                    print("Igrese sólamente números")
    for i in range(n):
        print(notas[i][0]+ "tiene un promedio de: " + str(sum(notas[i][1:])/len(notas[i][1:])))
