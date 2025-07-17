//Funcion de expender producto CONTIENE VALIDACI�N DE TIPO ALFABETICO y DIGITAL, aunque no se validan caracteres de otro tipo
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
		Escribir "Ingrese una clave de producto, estos deben tener el formato [LETRA][N�MERO] (Ejemplo: A1):"
		//Se lee la entrada de texto
		Leer entrada
		//Se omiten distinciones MAYUS/MINUS
		entrada = Mayusculas(entrada)
		//Se inicializa letra en falso y num en verdadero
		letra = Falso
		num = Verdadero
		//Condicional que valida que la clave sea completa y valida el formato (NO SE VALIDAN CARACTERES ESPECIALES)
		si Longitud(entrada) >= 2 Entonces
			//Ciclo para que revisa si el primer caracter es alfab�tico
			Para i<-1 Hasta Longitud("ABCDEFGHIJKLMNOPQRSTUVWXYZ") Con Paso 1 Hacer
				si Subcadena("ABCDEFGHIJKLMNOPQRSTUVWXYZ", i, i) = Subcadena(entrada, 1, 1) Entonces
					//Si es alfabetico se manda letra verdadero
					letra = Verdadero
				FinSi
				//Se valida que todos los caracteres posteriores al primero no sean alfabeticos, si lo son num = falso
				Para j<-2 Hasta Longitud(entrada) Con Paso 1 Hacer
					si Subcadena(entrada,j,j) = Subcadena("ABCDEFGHIJKLMNOPQRSTUVWXYZ", i, i) Entonces
						//Si hay una letra en la parte siguiente de la cadena se manda falso
						num = Falso
					FinSi
				Fin Para
			Fin Para
		sino
			//Para claves de cero o un caracter
			Limpiar Pantalla
			Escribir "-----------------------------------------------------------------------------"
			Escribir "ATENCI�N: Clave incorrecta"
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
			Escribir "ATENCI�N: El c�digo ", entrada, " NO cumple con el formato"
			Escribir "-----------------------------------------------------------------------------"
		FinSi
	Hasta Que bandera = Verdadero
	//Si la parte numerica de la cadena, no lo es, se provoca una excepci�n de tipo (A proposito)
	num = ConvertirANumero(Subcadena(entrada,2,Longitud(entrada))) es entero
	Limpiar Pantalla
	//Se valida saldo nulo, o saldo ingresado
	si saldo <> 0 Entonces
		//Si tiene saldo disponible se manda mensaje de expender y se vac�a el saldo
		Escribir "-----------------------------------------------------------------------------"
		Escribir "ATENCI�N: Se ha expendido el producto con c�digo ", entrada, " y se ha usado el saldo"
		Escribir "-----------------------------------------------------------------------------"
		saldo = 0
	SiNo
		//Mensaje de saldo cero
		Escribir "-----------------------------------------------------------------------------"
		Escribir "ATENCI�N: NO se ha expendido el producto con c�digo ", entrada, " ya que no hay saldo"
		Escribir "-----------------------------------------------------------------------------"
	FinSi
	
Fin Funcion

//Funcion de retiro de saldo, lo vuelve cero
//Recibe el saldo total
Funcion retirar ( saldo Por Referencia )
	si saldo = 0
		//Mensaje de saldo cero
		Escribir "-----------------------------------------------------------------------------"
		Escribir "ATENCI�N: NO se ha podido retirar el saldo ya que no hay."
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
	//Se muestra el saldo actual
	mostrar_saldo(saldo)
	//Se manda mensaje para el ususario
	Escribir "Ingrese una moneda:"
	//Se lee la moneda
	Leer moneda
	//Se valida que sea de la denominaci�n adecuada
	si (moneda = 1) o (moneda = 2) o (moneda = 5) o (moneda = 10) o (moneda = 20) Entonces
		//Si cumple con ser valida se acumula el saldo de la moneda ingresada
		saldo = saldo + moneda
		Limpiar Pantalla
	SiNo
		//Se manda error sobre la denominaci�n de la moneda ingresada
		Limpiar Pantalla
		Escribir "-----------------------------------------------------------------------------"
		Escribir "ATENCI�N: No se aceptan monedas de valor $", moneda, " Vuelva a intentarlo con una moneda v�lida."
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
	Escribir "Bienvenido a la expendedora de productos, para empezar, digite una clave del men�."
	//Se define una variable men� como cadena, para recibir la entrada del usuario
	Definir menu como cadena
	//Se define el saldo total ingresado como entero
	Definir total Como Entero
	//Se inicializa en 0
	total = 0
	//Ciclo para mantener en el men� hasta que la instrucci�n sea "PARA"
	Repetir
		//Se maneja el saldo en la parte superior
		mostrar_saldo(total)
		//Se manda mensaje del men� principal
		Escribir "Elija una opci�n."
		Escribir "NUMERO: Para agregar monedas."
		Escribir "IDENTIFICADOR: Para agregar el c�digo del producto deseado."
		Escribir "RETIRAR: Para cancelar la operaci�n y devolver el dinero agregado."
		Escribir "PARA: Para finalizar la transacci�n."
		Escribir ""
		//Se lee la respuesta del usuario
		Leer menu
		//Switch para verificar las opciones dadas por la variable le�da (menu). Se ignoran MAYUS/MINUS
		Segun Mayusculas(menu) Hacer
			"NUMERO":
				//Se limpia pantalla y se llama a la funci�n de ingreso de monedas mandando el total global
				Limpiar Pantalla
				ingresar(total)
			"IDENTIFICADOR":
				//se llama a la funci�n expender mandando el total
				expender(total)
			"RETIRAR":
				//Se limpia pantalla y se llama a la funci�n de retiro del total
				Limpiar Pantalla
				retirar(total)
			"PARA":
				//Actualiza men� para ignorar diferencias mayus/minus y para asegurar la salida del programa
				menu = Mayusculas(menu)
			De Otro Modo:
				//Se manda mensaje de error por excepci�n
				Limpiar Pantalla
				Escribir "La opci�n es incorrecta."
				Escribir "Verifique en no colocar espacios y digitar correctamente las palabras del men�."
		Fin Segun
	Hasta Que menu = "PARA"
FinAlgoritmo
