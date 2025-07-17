Algoritmo celsius_fahrenheit
	//Algoritmo para convierte e imprimir la temperatura en grados ºF, dada una temperatura en ºC por teclado. 
	//[Se asumen entradas reales (no se validan errores de tipo de entrada)].
	Definir celsius Como Real;
	Repetir
		Limpiar Pantalla;
		Escribir "Ingrese valores válidos de temperatura";
		Escribir "";
		Escribir "Ingrese su temperatura en ºC";
		Escribir "";
		Leer celsius;
	Hasta Que (celsius >= -273.15);
	Escribir celsius, "ºC de temperatura a ºF son: ", celsius*(9/5)+32.0, " ºF";
FinAlgoritmo
