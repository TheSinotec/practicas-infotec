Algoritmo area_triangulo
	//Algoritmo para calcular e imprimir el área de un triángulo dada su base y altura por teclado. 
	//[Se asumen entradas reales (no se validan errores de tipo de entrada)].
	Definir base, altura Como Real;
	Repetir
		Limpiar Pantalla;
		Escribir "Ingrese valores válidos para un triángulo";
		Escribir "Ingrese la base del triángulo";
		Escribir "";
		Leer base;
		Escribir "";
		Escribir "Ingrese la altura del triángulo";
		Escribir "";
		Leer altura;
	Hasta Que (base > 0.0) Y (altura > 0.0);
	Escribir "El área del triángulo es: ", base*(altura/2);
FinAlgoritmo
