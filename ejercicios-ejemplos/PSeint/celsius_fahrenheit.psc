Algoritmo celsius_fahrenheit
	//Algoritmo para convierte e imprimir la temperatura en grados �F, dada una temperatura en �C por teclado. 
	//[Se asumen entradas reales (no se validan errores de tipo de entrada)].
	Definir celsius Como Real;
	Repetir
		Limpiar Pantalla;
		Escribir "Ingrese valores v�lidos de temperatura";
		Escribir "";
		Escribir "Ingrese su temperatura en �C";
		Escribir "";
		Leer celsius;
	Hasta Que (celsius >= -273.15);
	Escribir celsius, "�C de temperatura a �F son: ", celsius*(9/5)+32.0, " �F";
FinAlgoritmo
