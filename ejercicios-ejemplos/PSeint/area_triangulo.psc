Algoritmo area_triangulo
	//Algoritmo para calcular e imprimir el �rea de un tri�ngulo dada su base y altura por teclado. 
	//[Se asumen entradas reales (no se validan errores de tipo de entrada)].
	Definir base, altura Como Real;
	Repetir
		Limpiar Pantalla;
		Escribir "Ingrese valores v�lidos para un tri�ngulo";
		Escribir "Ingrese la base del tri�ngulo";
		Escribir "";
		Leer base;
		Escribir "";
		Escribir "Ingrese la altura del tri�ngulo";
		Escribir "";
		Leer altura;
	Hasta Que (base > 0.0) Y (altura > 0.0);
	Escribir "El �rea del tri�ngulo es: ", base*(altura/2);
FinAlgoritmo
