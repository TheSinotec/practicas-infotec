Algoritmo area_triangulo_rectangulo
	//Algoritmo que valida y calcula el área de un triángulo rectángulo, al recibir sus lados por teclado
	Dimension lados[3];
	Definir lados como Real;
	Definir bandera Como Logico;
	bandera=Falso;
	Repetir
		Limpiar Pantalla;
		Escribir "Ingrese valores válidos para un triángulo";
		Escribir "Ingrese lado A del triángulo";
		Escribir "";
		Leer lados[1];
		Escribir "";
		Escribir "Ingrese lado B del triánguoo";
		Escribir "";
		Leer lados[2];
		Escribir "";
		Escribir "Ingrese lado C del triánguoo";
		Escribir "";
		Leer lados[3];
	Hasta Que (lados[1] > 0.0) Y (lados[2] > 0.0) Y (lados[3] > 0.0);
	Para i <- 1 Hasta 3 Con Paso 1 Hacer
		Si lados[i]^2=(lados[3-(i)%2 -TRUNC(i/3)])^2+(lados[4-i+TRUNC(i/3)-(i+1)%2])^2 Entonces
			Escribir "El área del triángulo es: ", lados[3-(i)%2 -TRUNC(i/3)]*lados[4-i+TRUNC(i/3)-(i+1)%2]/2;
			bandera=Verdadero
		FinSi
	Fin Para
	Si bandera=Falso Entonces
		Escribir "Tu triángulo no es rectángulo, intenta de nuevo";
	FinSi
FinAlgoritmo

