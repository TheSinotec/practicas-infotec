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

//Funcion de expender producto CONTIENE VALIDACIÓN DE TIPO ALFABETICO y DIGITAL, aunque no se validan caracteres de otro tipo
//Recibe el saldo total
Funcion expender ( saldo Por Referencia )
	//Se define una entrada como cadena
	Definir entrada Como cadena
	//Se definen tres banderas. bandera, una para el ciclo principal; letra, para validar el primer caracter; num, para validar que la parte sobrante de la cadena no sea alfabetico
	Definir bandera, letra, num Como Logico
	//Se inicializa como falso la bandera
	bandera = Falso
	Limpiar Pantalla
	//Ciclo que mantiene al ususario colocando valores hasta ser correcto
	Repetir
		//Se muestra el saldo actual
		mostrar_saldo(saldo)
		//Se manda mensaje para el ususario
		Escribir "Ingrese una clave de producto, estos deben tener el formato [LETRA][NÚMERO] (Ejemplo: A1):"
		//Se lee la entrada de texto
		Leer entrada
		//Se omiten distinciones MAYUS/MINUS
		entrada = Mayusculas(entrada)
		//Se inicializa letra en falso y num en verdadero
		letra = Falso
		num = Verdadero
		//Condicional que valida que la clave sea completa y valida el formato (NO SE VALIDAN CARACTERES ESPECIALES)
		si Longitud(entrada) >= 2 Entonces
			//Validacion del primer caracter como alfabetico
			letra = validar_cadena(Subcadena(entrada, 1, 1), "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
			//Validacion del primer caracter como numerico
			num = validar_cadena(Subcadena(entrada, 2, Longitud(entrada)), "1234567890")
		sino
			//Para claves de cero o un caracter
			Limpiar Pantalla
			Escribir "-----------------------------------------------------------------------------"
			Escribir "ATENCIÓN: Clave incorrecta"
			Escribir "-----------------------------------------------------------------------------"
		FinSi
		//Se valida que ambos den verdadero
		Si letra y num Entonces
			//Formato parcialmente correcto
			bandera = Verdadero
		SiNo
			//No se cumple con el formato y se manda mensaje
			Limpiar Pantalla
			Escribir "-----------------------------------------------------------------------------"
			Escribir "ATENCIÓN: El código ", entrada, " NO cumple con el formato"
			Escribir "-----------------------------------------------------------------------------"
		FinSi
	Hasta Que bandera = Verdadero
	Limpiar Pantalla
	//Se valida saldo nulo, o saldo ingresado
	si saldo <> 0 Entonces
		//Si tiene saldo disponible se manda mensaje de expender y se vacía el saldo
		Escribir "-----------------------------------------------------------------------------"
		Escribir "ATENCIÓN: Se ha expendido el producto con código ", entrada, " y se ha usado el saldo"
		Escribir "-----------------------------------------------------------------------------"
		saldo = 0
	SiNo
		//Mensaje de saldo cero
		Escribir "-----------------------------------------------------------------------------"
		Escribir "ATENCIÓN: NO se ha expendido el producto con código ", entrada, " ya que no hay saldo"
		Escribir "-----------------------------------------------------------------------------"
	FinSi
Fin Funcion

//Funcion de retiro de saldo, lo vuelve cero
//Recibe el saldo total
Funcion retirar ( saldo Por Referencia )
	si saldo = 0
		//Mensaje de saldo cero
		Escribir "-----------------------------------------------------------------------------"
		Escribir "ATENCIÓN: NO se ha podido retirar el saldo ya que no hay."
		Escribir "-----------------------------------------------------------------------------"
	SiNo
		//Manda mensaje al usuario y pone saldo a 0
		Escribir "-----------------------------------------------------------------------------"
		Escribir "Se han devuelto exitosamente $", saldo, " de la maquina expendedora."
		Escribir "-----------------------------------------------------------------------------"
		saldo = 0
	FinSi
Fin Funcion

//Funcion que recibe, valida monedas a ingresar, y actualiza el saldo total
//Recibe el saldo total a actualizar
Funcion ingresar ( saldo Por Referencia )
	//Se define una moneda como real, para comodidad del usuario
	Definir moneda Como Real
	//Se define la entrada como cadena
	Definir entrada como cadena
	//Validación de moneda 
	Repetir
		Limpiar Pantalla
		//Se muestra el saldo actual
		mostrar_saldo(saldo)
		//Se manda mensaje para el ususario
		Escribir "Ingrese una moneda:"
		//Se lee la moneda
		Leer entrada
	Hasta Que validar_cadena(entrada, "1234567890.") Y (contar_caracter(entrada, ".") <= 1)
	//se asigna el valor
	moneda = ConvertirANumero(entrada)
	//Se valida que sea de la denominación adecuada
	si (moneda = 1) o (moneda = 2) o (moneda = 5) o (moneda = 10) o (moneda = 20) Entonces
		//Si cumple con ser valida se acumula el saldo de la moneda ingresada
		saldo = saldo + moneda
		Limpiar Pantalla
	SiNo
		//Se manda error sobre la denominación de la moneda ingresada
		Limpiar Pantalla
		Escribir "-----------------------------------------------------------------------------"
		Escribir "ATENCIÓN: No se aceptan monedas de valor $", moneda, " Vuelva a intentarlo con una moneda válida."
		Escribir "-----------------------------------------------------------------------------"
	FinSi
Fin Funcion

//Funcion que muestra el saldo total actual
Funcion mostrar_saldo ( saldo Por Referencia )
	Escribir ""
	Escribir "----------------------------"
	Escribir "Su saldo actual es: $", saldo
	Escribir "----------------------------"
	Escribir ""
Fin Funcion

Algoritmo maquina_expendedora
	//Se manda mensaje al usuario
	Escribir "Bienvenido a la expendedora de productos, para empezar, digite una clave del menú."
	//Se define una variable menú como cadena, para recibir la entrada del usuario
	Definir menu como cadena
	//Se define el saldo total ingresado como entero
	Definir total Como Entero
	//Se inicializa en 0
	total = 0
	//Ciclo para mantener en el menú hasta que la instrucción sea "PARA"
	Repetir
		//Se maneja el saldo en la parte superior
		mostrar_saldo(total)
		//Se manda mensaje del menú principal
		Escribir "Elija una opción."
		Escribir "NUMERO: Para agregar monedas."
		Escribir "IDENTIFICADOR: Para agregar el código del producto deseado."
		Escribir "RETIRAR: Para cancelar la operación y devolver el dinero agregado."
		Escribir "PARA: Para finalizar la transacción."
		Escribir ""
		//Se lee la respuesta del usuario
		Leer menu
		//Switch para verificar las opciones dadas por la variable leída (menu). Se ignoran MAYUS/MINUS
		Segun Mayusculas(menu) Hacer
			"NUMERO":
				//Se limpia pantalla y se llama a la función de ingreso de monedas mandando el total global
				Limpiar Pantalla
				ingresar(total)
			"IDENTIFICADOR":
				//se llama a la función expender mandando el total
				expender(total)
			"RETIRAR":
				//Se limpia pantalla y se llama a la función de retiro del total
				Limpiar Pantalla
				retirar(total)
			"PARA":
				//Actualiza menú para ignorar diferencias mayus/minus y para asegurar la salida del programa
				menu = Mayusculas(menu)
			De Otro Modo:
				//Se manda mensaje de error por excepción
				Limpiar Pantalla
				Escribir "La opción es incorrecta."
				Escribir "Verifique en no colocar espacios y digitar correctamente las palabras del menú."
		Fin Segun
	Hasta Que menu = "PARA"
FinAlgoritmo
