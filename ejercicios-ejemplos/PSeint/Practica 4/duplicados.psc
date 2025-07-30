Funcion valido <- validar_cadena ( chain, dic )
	//Funcion auxiliar de validación de caracteres, dado un diccionario de caracteres
	//Se crea una bandera para validare cadena
	valido = Verdadero
	i = 0
	//Ciclo para validar caracteres de la cadena
	Mientras i < Longitud(chain) Hacer
		i = i + 1
		//Se inicializa bandera de caracter en Falso
		validar_caracter = Falso
		//Ciclo para recorrer el diccionario
		Para j<-1 Hasta Longitud(dic) Con Paso 1 Hacer
			//Se verifica si el caracter está en el diccionario
			si Subcadena(chain,i,i) = Subcadena(dic, j, j) Entonces
				//si esta se marca
				validar_caracter = Verdadero
			FinSi
		Fin Para
		//Si la bandera es falsa, es un caracter que no está en el diccionario
		si validar_caracter = Falso Entonces
			//Si hay un caracter que no está en la cadena, la cadena es invalida
			valido = Falso
			//escape
			i = i + Longitud(chain)
		FinSi
	Fin Mientras
Fin Funcion

Funcion cantidad <- contar_caracter ( chain, char )
	//Funcion para contar repeticiones de caracter en una cadena
	cantidad = 0
	//Ciclo para recorrer la cadena y buscar caracter
	Para i<-1 Hasta Longitud(chain) Con Paso 1 Hacer
		//Si se encuentra el carracter se cuenta
		si Subcadena(chain,i,i) = char Entonces
			//contador
			cantidad = cantidad + 1
		FinSi
	Fin Para
FinFuncion

Algoritmo duplicados
	//Algoritmo para generar un sub arreglo con los elementos duplicados de un arreglo dado por teclado.
	//Se inicializa un entero para contener la cantidad de elementos del arreglo
	Definir n Como Entero
	//Se define una entrada de texto
	Definir entrada como cadena
	//Mensaje de inicio del ususario
	Escribir "Este algortmo genera un sub-arreglo con los elementos repetidos de un arreglo dado."
	//Ciclo-validación del valor de n>0
	Repetir
		Escribir "Introduzca la cantidad de elementos deseado en su arreglo, debe ser un entero positivo:"
		//Se lee la entrada de texto y se limpia pantalla
		Leer entrada
		Limpiar Pantalla
		//Validacion de cantidad
		si validar_cadena(entrada, "1234567890") Y (entrada <> "0") Entonces
			n = ConvertirANumero(entrada)
		SiNo
			n = 0
		FinSi
	Hasta Que n>0;
	//Se define un arreglo de n elementos para almacenar el arreglo inicial
	Dimension inicial[n] 
	//Ciclo para pedir los n elementos al usuario
	Para i<-1 Hasta n Con Paso 1 Hacer
		//Ciclo-validación del valor de cada elemento
		Repetir
			//Mensaje y lectura de cada uno de los elementos del arreglo inicial
			Escribir "Ingrese el elemento #", i, " del arreglo:"
			//Se lee la entrada para validación
			Leer entrada
			Escribir ""
			Limpiar Pantalla
			//Validacion de enteros
			si no validar_cadena(entrada, "1234567890-") Entonces
				entrada = ""
			FinSi
			//Validacion de enteros negativos
			si ((contar_caracter(entrada, "-") = 1) Y (Subcadena(entrada,1,1) <> "-")) o (entrada = "-") Entonces
				entrada = ""
			FinSi
			//validacion -0 <> 0
			si entrada = "-0" Entonces
				entrada = "0"
			FinSi
		Hasta Que entrada <> "";
		//Se guarda el valor
		inicial[i] = ConvertirANumero(entrada)
	Fin Para
	Limpiar Pantalla
	//Defino una matriz de nx2 para contener cada elemento y sus repeticiones
	Dimension contador[n,2]
	//Defino dos contadores: maximo <= n, la cantidad de elementos sin repetición en contador; largo,un contador para la cantidad de elementos repetidos dos veces
	Definir maximo,largo Como Entero
	//Defino una bandera para observar cuando un elemento se repite
	Definir bandera Como Logico
	//El contador se asume tener al menos un elemento de inicio puesto que n>=1
	maximo = 1
	//Ciclo que cuenta las repeticiones de cada elemento único
	Para i<-1 Hasta n Con Paso 1 Hacer
		//Se inicializa la bandera en falso para cada valor de i
		bandera = Falso
		//Ciclo que lleva observa el contador y el elemento actual de inicial para ver si se repite
		Para j<-1 Hasta maximo Con Paso 1 Hacer
			//Si la matriz contador contiene ya al i-esimo elemento, la bandera se modifica a verdadero
			si (contador[j,1] = inicial[i]) Y (contador[j,2] <> 0) Entonces
				bandera = Verdadero				
			FinSi
		Fin Para
		//Si el elemento de inicial no está en la matriz contador, se agrega y se cuentan las repeticiones de todo el arreglo
		si bandera = Falso Entonces
			//Se agrega el valor del elemento del arreglo a la matiz contador
			contador[maximo,1]=inicial[i]
			//Se inicializa en 0 el conteo
			contador[maximo,2]=0
			//Ciclo para contar los elementos de todo el arreglo dado un elemento del mismo
			Para j<-1 Hasta n Con Paso 1 Hacer
				//Condicional que verifica coincidencia
				si inicial[j] = inicial[i] Entonces
					//Se cuenta en la matriz contador
					contador[maximo,2] = contador[maximo,2] + 1				
				FinSi
			Fin Para
			//Se aumenta en 1 la cantidad de elementos no vacíos en la matriz contador 
			maximo=maximo+1
		FinSi
	Fin Para
	//Se inicializa en 0 el contador de los elementos duplicados
	largo = 0
	//Ciclo que cuenta los elementos repetidos solo dos veces. maximo queda rebasado por 1, puesto que se asigna antes de contar (no inicia en 0)
	Para i<-1 Hasta maximo-1 Con Paso 1 Hacer
		//Se valida y se cuentan
		Si contador[i,2] = 2 Entonces
			largo = largo + 1
		FinSi
	Fin Para
	//Se inicializa el arreglo final con la cantidad de elementos repetidos exactamente dos veces
	Dimension final[largo]
	//Se reinicia largo en 0, para asignación de indices en final
	largo=0
	//La cadena siguiente es solo para mostrar el arreglo final en pantalla
	Definir muestra_arreglo como cadena
	//Se inicializa como un corchete de arreglo y se manda mensaje al usuario
	muestra_arreglo = "["
	Escribir "Arreglo final:"
	//Ciclo para llenado del arreglo final con los elementos duplicados y escritura del arreglo de muestra en pantalla
	Para i<-1 Hasta maximo-1 Con Paso 1 Hacer
		//Si es un elemento duplicado se llena el arreglo y la cadena
		Si contador[i,2] = 2 Entonces
			//Indice incremental para la posición del arreglo final
			largo = largo+1
			final[largo] = contador[i,1]
			//Se posicionan los elementos en la cadena
			muestra_arreglo = muestra_arreglo + ConvertirATexto(final[largo]) +", "
		FinSi
	Fin Para
	//Validación de caso límite un sólo elemento no repetido y formateo de cierre de la cadena
	Si Longitud(muestra_arreglo)=1 Entonces
		muestra_arreglo="[]"
	SiNo
		//Se limpia la expresión para mostrar un arreglo en pantalla adecuado
		muestra_arreglo = Subcadena(muestra_arreglo,1, Longitud(muestra_arreglo)-2) + "]"
	FinSi
	//se muestra el arreglo en pantalla
	Escribir muestra_arreglo
	//El arreglo final representa el arreglo de salida.	
FinAlgoritmo
