Algoritmo es_multiplo_seis
	//Algoritmo que muestra en pantalla si un número dado por teclado es múltiplo de seis (adicionalmente se muestran sus factores)
	Definir num Como Entero;
	Escribir "Ingrese sólo valores enteros. De lo contrario deberá intentarlo nuevamente";
	Escribir "Ingrese su número";
	Escribir "";
	Leer num;
	
	Si num%6=0 Entonces
		Escribir "n = ", num, " es múltiplo de 6 y ", num, " = 6*(",TRUNC(num/6), ")"; 
	SiNo
		Escribir "n = ", num, " NO es múltiplo de 6";
	FinSi
FinAlgoritmo
