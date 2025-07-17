Algoritmo promedio_nm
	//Algoritmo que calcula el promedio de una N cantidad de alumnos con una M cantidad de materias (muestra en pantalla).
	Definir n, m Como Entero;
	Definir auxiliar Como Real
	Repetir
		Limpiar Pantalla;
		Escribir "Ingrese sólo valores enteros positivos para N (número de alumnos) y M (número de materias)";
		Escribir "Ingrese el número de alumnos";
		Escribir "";
		Leer n;
		Escribir "";
		Escribir "Ingrese el número de materias";
		Escribir "";
		Leer m;
	Hasta Que (n > 0) Y (m > 0);
	Dimension nombres[n], notas[n];
	Limpiar Pantalla;
	Para i<-1 Hasta n Con Paso 1 Hacer
		Para j<-1 Hasta m+1 Con Paso 1 Hacer
			Si j==1 Entonces
				Escribir "";
				Escribir "Ingrese el nombre del alumno #", i;
				Escribir "";
				Leer nombres[i];
			SiNo
				Escribir "";
				Escribir "Ingrese la calificación de la materia #", j-1, " del alumno ", nombres[i];
				Escribir "";
				Leer auxiliar;
				notas[i]=notas[i]+auxiliar;
			FinSi
		Fin Para
	Fin Para
	Para i<-1 Hasta n Con Paso 1 Hacer
		Escribir nombres[i], " tiene un promedio de: ", (notas[i]/m);
	Fin Para
FinAlgoritmo
