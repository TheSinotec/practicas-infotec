Algoritmo es_multiplo_seis
	//Algoritmo que muestra en pantalla si un n�mero dado por teclado es m�ltiplo de seis (adicionalmente se muestran sus factores)
	Definir num Como Entero;
	Escribir "Ingrese s�lo valores enteros. De lo contrario deber� intentarlo nuevamente";
	Escribir "Ingrese su n�mero";
	Escribir "";
	Leer num;
	
	Si num%6=0 Entonces
		Escribir "n = ", num, " es m�ltiplo de 6 y ", num, " = 6*(",TRUNC(num/6), ")"; 
	SiNo
		Escribir "n = ", num, " NO es m�ltiplo de 6";
	FinSi
FinAlgoritmo
