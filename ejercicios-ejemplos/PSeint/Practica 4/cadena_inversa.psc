Algoritmo cadena_inversa
	//Se define la entrada del ususario como una cadena de texto
	Definir entrada como cadena
	//Se muestra mensaje al usuario y se captura la entrada de texto
	Escribir "Para verificar si una palabra es pal�ndroma, introduzca una palabra:"
	Escribir ""
	Leer entrada
	//Se define un booleano de control para validar espacios vac�os en los extremos de la cadena
	Definir bandera Como Logico
	//Se inicializa bandera en verdadero
	bandera = Verdadero
	//Ciclo mientras para eliminar espacios vac�os en el extremo izquierdo de la cadena
	Repetir
		//Si no hay espacios vac�os se cambia la bandera; en caso contrario, se elimina el caracter vac�o
		si Subcadena(entrada,1,1) <> " " Entonces
			bandera = Falso
		SiNo
			entrada = Subcadena(entrada, 2, Longitud(entrada)) 
		FinSi
	Hasta Que bandera = Falso
	//Se reinicia la bandera
	bandera = Verdadero
	//Ciclo mientras para eliminar espacios vac�os en el extremo derecho de la cadena
	Repetir
		//Si no hay espacios se cambia bandera; si no, se elimina el caracter vac�o
		si Subcadena(entrada,Longitud(entrada),Longitud(entrada)) <> " " Entonces
			bandera = Falso
		SiNo
			entrada = Subcadena(entrada, 1, Longitud(entrada)-1) 
		FinSi
	Hasta Que bandera = Falso
	//Se reutiliza la bandera, ahora para validar caracteres especulares que no coincidan
	bandera = Verdadero
	//Ciclo para validar caracteres extremos desde la mitad de la cadena
	Para i<-1 Hasta Trunc(Longitud(entrada)/2) Con Paso 1 Hacer
		//Si uno de los caracteres especulares no coincide, no es pal�ndromo, bandera = falso. Se ignoran MAYUS/MINUS
		Si Subcadena(Mayusculas(entrada),i,i) <> Subcadena(Mayusculas(entrada),Longitud(entrada)+1-i,Longitud(entrada)+1-i) Entonces
			bandera = Falso 
		FinSi
	Fin Para
	//Validaci�n e impresi�n del mensaje de confirmaci�n, seg�n el valor de la bandera
	Si bandera = Verdadero Entonces
		Escribir "[", entrada + "] es un pan�ndromo."
	SiNo
		Escribir "[", entrada + "] NO es un pan�ndromo."
	FinSi
	//bandera representa el valor de salida: Verdadero, pal�ndromo; Falso, No pal�ndromo
FinAlgoritmo
