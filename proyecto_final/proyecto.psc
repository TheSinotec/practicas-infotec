//Confirmación por teclado
Funcion pausa ( clean )
	Escribir ""
	Escribir "Presione una tecla para continuar.."
	Esperar Tecla
	Si clean = Verdadero Entonces
		Limpiar Pantalla
	FinSi
Fin Funcion

//Descifrado
Funcion decifrar
	Escribir "Para comenzar se requiere que tenga al menos dos de las llaves de cifrado utilizadas para encriptar el mensaje."
	Escribir "Si no las tiene, el mensaje no podrá ser desencriptado. Puede escapar de esta pantalla en todo momento digitando: X"
	pausa(Falso)
	Definir entrada, llave1, llave2 como cadena
	llave1 = ""
	llave2 = ""
	Repetir
		Limpiar Pantalla
		Escribir "Ingrese la llave #1 o digite X para salir:"
		Leer entrada
	Hasta Que validar_llave(entrada) o Mayusculas(entrada) = "X"
	Limpiar Pantalla
	Si Mayusculas(entrada) <> "X" Entonces
		llave1 = entrada
		Repetir
			Limpiar Pantalla
			Escribir "Ingrese la llave #2 o digite X para salir:"
			Leer entrada
			si entrada = llave1 Entonces
				Escribir "Ingrese una llave diferente a la primera."
				pausa(Falso)
				entrada = ""
			FinSi
		Hasta Que validar_llave(entrada) o Mayusculas(entrada) = "X"
		Si Mayusculas(entrada) <> "X" Entonces
			llave2 = entrada
		FinSi
	FinSi
	Si llave1 = "" o llave2 = "" Entonces
		Limpiar Pantalla
	SiNo
		Limpiar Pantalla
		//CAPTURA DE TEXTO
		//MENSAJE PARA DESENCRIPTAR
		diccionario = "0123456789"
		Definir dato como cadena
		Escribir "ATENCIÓN: Lea cuidadosamente."
		Escribir "Deberá ingresar cada linea de texto de forma individual."
		Escribir "El programa evaluará cada linea y la reformateará según lo requerido, y usted deberá confirmar o descartar la linea."
		Escribir "El programa sólo acepta los siguientes caracteres numéricos: " + diccionario
		Escribir "El programa omitirá caracteres no contenidos en el caso anterior."
		Escribir "Si el programa no puede desencriptar el mensaje arrojara la excepción: [<null>]"
		pausa(Falso)
		Repetir
			Limpiar Pantalla
			dato = ""
			Escribir "Ingrese una linea de texto encriptada o digite & para salir:"
			Leer entrada
			si entrada <> "&" Entonces
				entrada = limpiar_cadena(entrada, diccionario)
				entrada = eliminar_espacios(entrada)
			SiNo
				Limpiar Pantalla
			FinSi
			Si entrada <> "" y entrada <> "&" Entonces
				Repetir
					Limpiar Pantalla
					Escribir "El programa considerará la siguiente linea:"
					Escribir entrada
					Escribir ""
					Escribir "¿Desea continuar? [S/N]"
					Leer dato
				Hasta Que Mayusculas(dato) = "S" o Mayusculas(dato) = "N"
				Segun Mayusculas(dato) Hacer
					"S":
						//DECRYPT
						Limpiar Pantalla
						//Calculo de polinomio
						Dimension coordenadas[2]
						obtener_coordenadas(llave1, llave2, coordenadas)
						//Cambio de diccionario
						diccionario = "¿?!¡*+-=/@#%$_.:;,AaBbCcDdEeFfGgHhIiJjKkLlMmNnÑñOoPpQqRrsSTtUuVvWwXxYyZz0123456789()[]{}"
						decrypt_palabra =  desencriptar_cadena(entrada, coordenadas)
						palabra = ""
						palabra = traductor_numero_cadena(decrypt_palabra, diccionario)
						palabra = Subcadena(palabra, 1, Longitud(palabra)-1)
						Escribir  "Su texto fue descifrado, su mensaje es:"
						si palabra = "" Entonces
							Escribir "[<null>]"
						SiNo
							Escribir palabra
						FinSi
						pausa(Verdadero)
					"N":
						entrada = ""
					De Otro Modo:
						entrada = ""
				Fin Segun
			FinSi
		Hasta Que entrada <> "" o Mayusculas(entrada) = "&"
	FinSi
	
Fin Funcion

//Cifrado
Funcion cifrar
	Escribir "Para comenzar se requiere que tenga al menos dos llaves de cifrado a la mano."
	Escribir "Si no las tiene, genérelas en el menú anterior. Puede escapar de esta pantalla en todo momento digitando: X"
	pausa(Falso)
	Definir entrada, llave1, llave2 como cadena
	llave1 = ""
	llave2 = ""
	Repetir
		Limpiar Pantalla
		Escribir "Ingrese la llave #1 o digite X para salir:"
		Leer entrada
	Hasta Que validar_llave(entrada) o Mayusculas(entrada) = "X"
	Limpiar Pantalla
	Si Mayusculas(entrada) <> "X" Entonces
		llave1 = entrada
		Repetir
			Limpiar Pantalla
			Escribir "Ingrese la llave #2 o digite X para salir:"
			Leer entrada
			si entrada = llave1 Entonces
				Escribir "Ingrese una llave diferente a la primera."
				pausa(Falso)
				entrada = ""
			FinSi
		Hasta Que validar_llave(entrada) o Mayusculas(entrada) = "X"
		Si Mayusculas(entrada) <> "X" Entonces
			llave2 = entrada
		FinSi
	FinSi
	Si llave1 = "" o llave2 = "" Entonces
		Limpiar Pantalla
	SiNo
		Limpiar Pantalla
		//CAPTURA DE TEXTO
		diccionario = "¿?!¡*+-=/@#%$_.:;,AaBbCcDdEeFfGgHhIiJjKkLlMmNnÑñOoPpQqRrsSTtUuVvWwXxYyZz0123456789()[]{}"
		Definir dato como cadena
		Escribir "ATENCIÓN: Lea cuidadosamente."
		Escribir "Deberá ingresar cada linea de texto de forma individual."
		Escribir "Cada palabra de cada linea deberá contener a lo más 240 caracteres."
		Escribir "El programa evaluará cada linea y la reformateará según su diccionario de palabras, y usted deberá confirmar o descartar la linea."
		Escribir "El programa sólo acepta los siguientes caracteres especiales: " + "¿?!¡*+-=/@#%$_.:;,()[]{}"
		Escribir "El programa sólo acepta los siguientes caracteres alfanuméricos: " + "AaBbCcDdEeFfGgHhIiJjKkLlMmNnÑñOoPpQqRrsSTtUuVvWwXxYyZz0123456789"
		Escribir "El programa omitirá caracteres no contenidos en los anteriores casos."
		Escribir "El uso de llaves aleatorias puede generar cadenas de texto indecifrables. [DEBE USAR ÚNICAMENTE LLAVES GENERADAS EN ESTE PROGRAMA]"
		pausa(Falso)
		Repetir
			Limpiar Pantalla
			dato = ""
			Escribir "Ingrese una linea de texto o digite & para salir:"
			Leer entrada
			si entrada <> "&" Entonces
				entrada = limpiar_cadena(entrada, diccionario)
			SiNo
				Limpiar Pantalla
			FinSi
			Si entrada <> "" y entrada <> "&" Entonces
				Repetir
					Limpiar Pantalla
					Escribir "El programa considerará la siguiente linea:"
					Escribir entrada
					Escribir ""
					Escribir "¿Desea continuar? [S/N]"
					Leer dato
				Hasta Que Mayusculas(dato) = "S" o Mayusculas(dato) = "N"
				Segun Mayusculas(dato) Hacer
					"S":
						//CRYPT
						Limpiar Pantalla
						entrada = formato_espacios(entrada)
						excepcion = Falso
						newcadena = traductor_cadena_numero(entrada, diccionario, excepcion)
						//excepcion verdadero > 240 char
						si excepcion = Verdadero Entonces
							Escribir "Una de las palabras contiene más de 240 caracteres. Intente nuevamente, respetando el límite."
						SiNo
							//Calculo de polinom, se deben validar las coordenadas
							Dimension coordenadas[2]
							obtener_coordenadas(llave1, llave2, coordenadas)
							//Encriptar
							final = ""
							encriptar_cadena(newcadena, coordenadas, final)
							final = limpiar_cadena(final, "0123456789")
							final = eliminar_espacios(final)
							Escribir  "Su texto fue cifrado y sólo podrá ser recuperado con dos de las tres llaves, su mensaje ahora es:"
							Escribir final
							pausa(Verdadero)
						FinSi
					"N":
						entrada = ""
					De Otro Modo:
						entrada = ""
				Fin Segun
			FinSi
		Hasta Que entrada <> "" o Mayusculas(entrada) = "&"
	FinSi
Fin Funcion

//Validar llave
Funcion valido <- validar_llave ( llave )
	valido = Verdadero
	guiones = 0
	llave = formato_espacios(llave)
	Para i<-1 Hasta Longitud(llave) Con Paso 1 Hacer
		validar_caracter = Falso
		Para j<-1 Hasta 11 Con Paso 1 Hacer
			si Subcadena(llave, i , i) = Subcadena("1234567890_", j, j) Entonces
				validar_caracter = Verdadero
				si Subcadena(llave, i , i) = "_" Entonces
					guiones = guiones + 1
					Si i = 1 o i = Longitud(llave) Entonces
						valido = Falso
					FinSi
				FinSi
			FinSi
		Fin Para
		Si validar_caracter = Falso Entonces
			valido = Falso
		FinSi
	Fin Para
	Si guiones <> 1 Entonces
		valido = Falso
	FinSi
	Si valido = Verdadero Entonces
		i = 1
		Mientras Subcadena(llave, i, i) <> "_" Hacer
			i = i+1
		Fin Mientras
		si (ConvertirANumero(Subcadena(llave, 1, i-1)) > 999999) o (ConvertirANumero(Subcadena(llave, i+1, Longitud(llave))) > (999999*999999+999999)) o (ConvertirANumero(Subcadena(llave, 1, i-1)) = 0) o (ConvertirANumero(Subcadena(llave, i+1, Longitud(llave))) = 0) Entonces
			valido = Falso
		FinSi
	FinSi
Fin Funcion

//Menu real
Funcion real_menu
	Escribir "AVISO: USTED A INGRESADO AL MODO SECRETO"
	pausa(Verdadero)
	Definir menu como cadena
	Repetir
		Escribir "Ingrese una opción:"
		Escribir ""
		Escribir "LLAVES: Para obtener 3 llaves diferentes y únicas de encriptación (se requieren 2 llaves diferentes para el proceso de cifrado y decifrado)."
		Escribir "CIFRAR: Para cifrar un texto."
		Escribir "DESCIFRAR: Para cifrar un texto."
		Escribir "SALIR: Para regresar a la tapadera."
		Escribir ""
		Leer menu
		Segun Mayusculas(menu) Hacer
			"LLAVES":
				Limpiar Pantalla
				Escribir "GENERANDO LLAVES:"
				Escribir ""
				keygen()
				Escribir ""
				Escribir "Resguarde sus llaves en un lugar seguro. Recuerde que se requieren al menos dos llaves para cifrar y decifrar."
				pausa(Verdadero)
			"CIFRAR":
				Limpiar Pantalla
				cifrar()
			"DESCIFRAR":
				Limpiar Pantalla
				decifrar()
			"SALIR":
				Limpiar Pantalla
				menu = Mayusculas(menu)
			De Otro Modo:
				Limpiar Pantalla
				Escribir "ATENCIÓN: OPCIÓN INVÁLIDA"
		Fin Segun
	Hasta Que menu = "SALIR"
	
Fin Funcion

//Menu tapadera
Funcion  falso_menu
	Escribir "Bienvenido al proyecto de Jonatán Salgado Razo"
	pausa(Verdadero)
	Definir menu como cadena
	Repetir
		Escribir "Ingrese una opción:"
		Escribir ""
		Escribir "HORA: Para obtener la hora local."
		Escribir "FECHA: Para obtener la fecha."
		Escribir "AYUDA: Para obtener una descripción útil."
		Escribir "SALIR: Para obtener la salir del programa."
		Escribir ""
		Leer menu
		Segun Mayusculas(menu) Hacer
			"HORA":
				Limpiar Pantalla
				Escribir ""
				Escribir "La hora exacta es: " + Subcadena(ConvertirATexto(HoraActual()),1,2) + ":" + Subcadena(ConvertirATexto(HoraActual()),3,4)
				Escribir ""
			"FECHA":
				Limpiar Pantalla
				Escribir ""
				Escribir "La fecha de hoy es: " + Subcadena(ConvertirATexto(FechaActual()),7,8) + "/" + Subcadena(ConvertirATexto(FechaActual()),5,6) + "/" + Subcadena(ConvertirATexto(FechaActual()),1,4)
				Escribir ""
			"SECRETO":
				Limpiar Pantalla
				//inicia la fiesta
				real_menu()
			"AYUDA":
				Limpiar Pantalla
				Escribir "Este programa es el proyecto de Jonatán Salgado Razo."
				Escribir "Lea atentamente:"
				Escribir "El objetivo de este programa es brindar un ambiente seguro para la obtención de la hora y fecha, así como brindar al usuario de un menú agradable e intuitivo en el cuál pueda TECLEAR sus opciones facilmente."
				Escribir "El correcto funcionamiento de este producto no es un SECRETO, ya que puede consultarse en el reporte de la práctica, se recomienda consultarlo antes de usarse."
				pausa(Verdadero)
			"SALIR":
				menu = Mayusculas(menu)
			De Otro Modo:
				Limpiar Pantalla
				Escribir "ATENCIÓN: OPCIÓN INVÁLIDA"
				Escribir ""
		Fin Segun
	Hasta Que menu = "SALIR"
Fin Funcion

//funcion eliminar espacios
Funcion chain <- eliminar_espacios ( chain )
	chain = formato_espacios(chain)
	i = 1
	Mientras i < Longitud(chain) Hacer
		si Subcadena(chain, i, i) = " " Entonces
			chain = Subcadena(chain, 1, i-1) + Subcadena(chain, i+1, Longitud(chain))
		SiNo
			i = i + 1
		FinSi
	FinMientras
FinFuncion

//Funcion de restricción de caracteres
Funcion newchain <- limpiar_cadena ( chain, dic )
	newchain = formato_espacios(chain)
	i = 0
	Mientras i < Longitud(newchain) Hacer
		i = i + 1
		bandera_caracter = Falso
		Para j<-1 Hasta Longitud(dic) Con Paso 1 Hacer
			si (Subcadena(newchain, i, i) = Subcadena(dic, j, j)) O (Subcadena(newchain, i, i) = " ") Entonces
				bandera_caracter = Verdadero
			FinSi
		Fin Para
		si bandera_caracter = Falso Entonces
			si i = 1 o i = Longitud(newchain) Entonces
				si i = 1 Entonces
					newchain = " " + Subcadena(newchain, i+1, Longitud(newchain))
				FinSi
				si i = Longitud(newchain) Entonces
					newchain = Subcadena(newchain, 1, i-1) + " "
				FinSi
			SiNo
				newchain = Subcadena(newchain, 1, i-1) + " " + Subcadena(newchain, i+1, Longitud(newchain))
			FinSi
		FinSi
	Fin Mientras
	newchain = formato_espacios(newchain)
Fin Funcion

//Funcion de desencriptación de cadena
Funcion newchain <- desencriptar_cadena ( chain, coord )
	newchain = ""
	posicion = 1
	Mientras posicion < Longitud(chain) Hacer
		extracto = Subcadena(chain, posicion + 3, posicion + 2 + ConvertirANumero(Subcadena(chain,posicion,posicion+2)))
		i = 1
		decrypt_frag = ""
		Mientras i < Longitud(extracto) Hacer
			decrypt_frag = decrypt_frag + desencriptar_fragmento(Subcadena(extracto, i+2, ConvertirANumero(Subcadena(extracto, i, i+1))+i+1), coord)
			i = i + 2 + ConvertirANumero(Subcadena(extracto, i, i+1))
		Fin Mientras
		//BOM 3bytes
		si Longitud(decrypt_frag)/2 < 100 Entonces
			si Longitud(decrypt_frag)/2 < 10 Entonces
				newchain = newchain + "00" + ConvertirATexto(Longitud(decrypt_frag)/2) + decrypt_frag
			SiNo
				newchain = newchain + "0" + ConvertirATexto(Longitud(decrypt_frag)/2) + decrypt_frag				
			FinSi
		SiNo
			newchain = newchain + ConvertirATexto(Longitud(decrypt_frag)/2) + decrypt_frag
		FinSi
		posicion = posicion + 3 + ConvertirANumero(Subcadena(chain, posicion, posicion + 2))
	Fin Mientras
	
Fin Funcion

//Funcion de encriptacion de cadena, doble BOM
Funcion encriptar_cadena ( chain, coord, newchain Por Referencia)
	si Longitud(chain) <> 0 Entonces
		newchain = newchain + encriptar_palabra(Subcadena(chain, 4, 3 + ConvertirANumero(Subcadena(chain,1,3))*2), coord)
		encriptar_cadena(Subcadena(chain, 4 + ConvertirANumero(Subcadena(chain,1,3))*2, Longitud(chain)), coord, newchain)
	FinSi
Fin Funcion

//Funcion de encriptación para cada palabra + BOM por fragmento + BOM por palabra
Funcion newchain <- encriptar_palabra ( chain, coord )
	newchain = ""
	Para i<-1 Hasta Longitud(chain) Con Paso 8 Hacer
		newchain = newchain + encriptar_fragmento(Subcadena(chain, i, 7+i), coord)
	Fin Para
	//FINAL BOM (3 bytes)
	Si Longitud(newchain) < 100 Entonces
		si Longitud(newchain) < 10 Entonces
			newchain = "00" + ConvertirATexto(Longitud(newchain)) + newchain
		SiNo
			newchain = "0" + ConvertirATexto(Longitud(newchain)) + newchain
		FinSi
	SiNo
		newchain = ConvertirATexto(Longitud(newchain)) + newchain
	FinSi
Fin Funcion

//Funcion de encriptación de fragmento de 8 caracteres
Funcion newchain <- encriptar_fragmento ( chain, coord )
	newchain = ConvertirATexto((coord[1]*(ConvertirANumero(chain)) + coord[2]))
	Si Longitud(newchain) < 10 Entonces
		newchain = "0" + ConvertirATexto(Longitud(newchain)) + newchain
	SiNo
		newchain = ConvertirATexto(Longitud(newchain)) + newchain
	FinSi
Fin Funcion

//Funcion de desencriptar fragmento
Funcion newchain <- desencriptar_fragmento ( chain, coord )
	final = ConvertirATexto((ConvertirANumero(chain) - coord[2])/coord[1])
	si Longitud(final) % 2 <> 0 Entonces
		newchain = "0" + final
	SiNo
		newchain = final
	FinSi
Fin Funcion

//Obtención de coordenadas según las dos llaves
Funcion obtener_coordenadas ( llave_1, llave_2, coord)
	i = 1
	Mientras Subcadena(llave_1, i, i) <> "_" Hacer
		i = i+1
	Fin Mientras
	x_0 = ConvertirANumero(Subcadena(llave_1, 1, i-1))
	f_0 = ConvertirANumero(Subcadena(llave_1, i+1, Longitud(llave_1)))
	i = 1
	Mientras Subcadena(llave_2, i, i) <> "_" Hacer
		i = i+1
	Fin Mientras
	x_1 = ConvertirANumero(Subcadena(llave_2, 1, i-1))
	f_1 = ConvertirANumero(Subcadena(llave_2, i+1, Longitud(llave_2)))
	coord[1] = (f_0 - f_1)/(x_0 - x_1)
	coord[2] = f_1 - coord[1]*x_1
Fin Funcion

//Generador de 3 llaves Shamir 2º
Funcion keygen
	coeficiente = azar(999999)
	Esperar azar(459) Milisegundos
	termino = azar(999999)
	Esperar azar(459) Milisegundos
	independiente = azar(999999)
	Escribir "Llave 1: " + ConvertirATexto(termino) + "_" + ConvertirATexto(coeficiente*termino + independiente)
	Esperar azar(459) Milisegundos
	termino = azar(999999)
	Escribir "Llave 2: " + ConvertirATexto(termino) + "_" + ConvertirATexto(coeficiente*termino + independiente)
	Esperar azar(459) Milisegundos
	termino = azar(999999)
	Escribir "Llave 3: " + ConvertirATexto(termino) + "_" + ConvertirATexto(coeficiente*termino + independiente)
Fin Funcion

//Funcion de formateo de espacios (solo un espacio separador entre palabras)
Funcion chain <- formato_espacios ( chain )
	Mientras Subcadena(chain, 1, 1) = " " Hacer
		chain = Subcadena(chain, 2, Longitud(chain))
	Fin Mientras
	Mientras Subcadena(chain, Longitud(chain), Longitud(chain)) = " " Hacer
		chain = Subcadena(chain, 1, Longitud(chain)-1)
	Fin Mientras
	Para i<-1 Hasta Longitud(chain) Con Paso 1 Hacer
		Si Subcadena(chain, i, i) = " " Entonces
			j = i+1
			Mientras Subcadena(chain,j,j) = " " Hacer
				j = j+1
			Fin Mientras
			chain = Subcadena(chain,1,i) + Subcadena(chain, j, Longitud(chain))
		FinSi
	Fin Para
Fin Funcion

//Funcion que pasa de cadena a numero + metodología BOM compositor (Byte order mark)
Funcion newchain <- traductor_cadena_numero ( chain , dic, exept Por Referencia)
	newchain = ""
	chain = " " +  chain
	Para i<-1 Hasta Longitud(chain) Con Paso 1 Hacer
		si Subcadena(chain,i,i) <> " " Entonces
			j = 1
			Mientras (Subcadena(chain,i,i) <> Subcadena(dic, j, j)) Y (j < Longitud(dic) + 1) Hacer
				j = j + 1
			Fin Mientras
			//Validacion Por fuera del diccionario
			si j = Longitud(dic) + 1 Entonces
				j = 0
			FinSi
			Si j < 10 Entonces
				newchain = newchain + "0" + ConvertirATexto(j)
			SiNo
				newchain = newchain + ConvertirATexto(j)
			FinSi
		SiNo
			j = i+1
			Mientras (Subcadena(chain, j, j) <> " ") Y (j <> Longitud(chain)) Hacer
				j = j+1
			Fin Mientras
			//corrección de último caracter
			si j = Longitud(chain) Entonces
				j = j+1
			FinSi
			si j-i-1 < 100 Entonces
				si j-i-1 < 10 Entonces
					newchain = newchain + "00" + ConvertirATexto(j-i-1)
				SiNo
					newchain = newchain + "0" + ConvertirATexto(j-i-1)
				FinSi
			SiNo
				newchain = newchain + ConvertirATexto(j-i-1)
				si j-i-1 > 240
					exept = Verdadero
				FinSi
			FinSi
		FinSi
	Fin Para
Fin Funcion

//Traductor numero en formato de "2 bytes" por caracter a palabra
Funcion palabra <- traductor_numero_palabra ( chain, dic )
	palabra = ""
	Para i<-1 Hasta Longitud(chain) Con Paso 2 Hacer
		palabra = palabra + Subcadena(dic,ConvertirANumero(Subcadena(chain, i, i+1)), ConvertirANumero(Subcadena(chain, i, i+1)))
	Fin Para
Fin Funcion


//Traductor de numero a cadena + BOM descompositor
Funcion newchain <- traductor_numero_cadena ( chain, dic )
	Si Longitud(chain) <> 0 Entonces
		newchain = newchain + traductor_numero_palabra(Subcadena(chain, 4, 3 + ConvertirANumero(Subcadena(chain,1,3))*2), dic)
		newchain = newchain + " " + traductor_numero_cadena(Subcadena(chain,4 + ConvertirANumero(Subcadena(chain,1,3))*2, Longitud(chain)), dic)
	FinSi
Fin Funcion


///PRUEBAS UNITARIAS
Funcion prueba1
	Escribir "PRUEBA:  Funcion newchain <- traductor_cadena_numero ( chain , dic, exept Por Referencia)"
	Escribir "Función que genera una cadena de caracteres compuesta por numeros, a partir de una cadena de texto según un diccionario y que señaliza si una palabra posee más de 240 caracteres"
	Escribir "PARÁMETROS: "
	Escribir "chain - cadena: La cadena de texto que se traduce a numero"
	Escribir "dic - cadena: Una cadena de texto con los caracteres que restringen a chain"
	Escribir "except - booleano (Por referencia): Cambia el valor de una bandera a Verdadero si alguna palabra contiene más de 240 caracteres"
	Escribir "RETORNO: "
	Escribir "newchain - cadena: Una cadena de texto conformada sólo por números, usando un Byte Order Mark de 3 bytes para cada palabra"
	Escribir ""
	Esperar 1 segundos
	Definir excepcion Como Logico
	Escribir "Assert: TRUE"
	Escribir "Se define una variable de excepción <<except>> como Falso"
	excepcion = Falso
	Escribir "Se invoca a la función traductor_cadena_numero, con los siguientes parámetros"
	Escribir "chain: <<Holaaa Mundooo! :3>>", " ", "dic: <<HMadlnou3!: >>"
	Escribir "(todos los caracteres de chain estan en dic)"
	Escribir "El resultado de la prueba"
	Escribir "newchain: <<",traductor_cadena_numero("Holaaa Mundooo! :3", "HMadlnou3!: ", excepcion), ">> ", " except: <<",excepcion, ">>"
	Escribir ""
	Esperar 1 segundos
	Escribir "Assert: FALSE"
	Escribir "Se define una variable de excepción <<except>> como Verdadero"
	excepcion = Verdadero
	Escribir "Se invoca a la función traductor_cadena_numero, con los siguientes parámetros"
	Escribir "chain: <<Holaaa Mundooo! :3>>", " ", "dic: <<pbc012>>"
	Escribir "(ninguno de los caracteres de chain estan en dic)"
	Escribir "El resultado de la prueba"
	Escribir "newchain: <<",traductor_cadena_numero("Holaaa Mundooo! :3", "pbc012", excepcion), ">> ", " except: <<",excepcion, ">>"
	Escribir ""
	Esperar 1 segundos
	Escribir "Assert: TRUE"
	Escribir "Se define una variable de excepción <<except>> como Falso"
	excepcion = Falso
	Escribir "Se invoca a la función traductor_cadena_numero, con los siguientes parámetros"
	Escribir "chain: <<a>>*241 (241 caracteres <<a>>)", " ", "dic: <<a>>"
	Escribir "(ninguno de los caracteres de chain estan en dic)"
	Escribir "El resultado de la prueba"
	Escribir "newchain: <<",traductor_cadena_numero("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "a", excepcion), ">> ", " except: <<",excepcion, ">>"
	Escribir ""
FinFuncion

Funcion prueba2
	Escribir "PRUEBA:  Funcion chain <- formato_espacios ( chain )"
	Escribir "Función que reformatea una cadena de texto con un sólo espacio entre palabras y ningun espacio a los extremos, a partir de una cadena de texto inicial"
	Escribir "PARÁMETROS: "
	Escribir "chain - cadena: La cadena de texto que quiere formatear"
	Escribir "RETORNO: "
	Escribir "chain - cadena: La cadena de texto reformateada"
	Escribir ""
	Esperar 1 segundos
	Escribir "Assert: TRUE"
	Escribir "Se invoca a la función formato_espacios, con los siguientes parámetros"
	Escribir "chain: <<    Holaaa     a    todo          el   Mundooo!   :3    >>"
	Escribir "El resultado de la prueba"
	Escribir "chain: <<",formato_espacios("    Holaaa     a    todo          el   Mundooo!   :3    "), ">> "
	Escribir ""
FinFuncion

Funcion prueba3
	Escribir "PRUEBA:  Funcion newchain <- traductor_numero_cadena ( chain , dic)"
	Escribir "Función que genera una cadena de caracteres a partir de una cadena de texto compuesta por números según un diccionario"
	Escribir "PARÁMETROS: "
	Escribir "chain - cadena: La cadena de texto compuesta solo por números que se traduce a caracteres"
	Escribir "dic - cadena: Una cadena de texto con los caracteres que restringen a chain"
	Escribir "RETORNO: "
	Escribir "newchain - cadena: Una cadena de texto resultado de la traduccion"
	Escribir ""
	Esperar 1 segundos
	Escribir "Assert: TRUE"
	Escribir "Se invoca a la función traductor_numero_cadena, con los siguientes parámetros"
	Escribir "chain: <<00601070503030300802080604070707100021109>>", " ", "dic: <<HMadlnou3!: >>"
	Escribir "(los caracteres de chain no exceden el dic)"
	Escribir "El resultado de la prueba"
	Escribir "newchain: <<",traductor_numero_cadena("00601070503030300802080604070707100021109", "HMadlnou3!: "), ">> "
	Escribir ""
	Esperar 1 segundos
	Escribir "Assert: FALSE"
	Escribir "Se invoca a la función traductor_numero_cadena, con los siguientes parámetros"
	Escribir "chain: <<0050405060708>>", " ", "dic: <<abc>>"
	Escribir "(los caracteres de chain exceden el dic)"
	Escribir "El resultado de la prueba"
	Escribir "newchain: <<",traductor_numero_cadena("00104", "abc"), ">> "
	Escribir ""
	Esperar 1 segundos
	Escribir "Assert: FALSE"
	Escribir "Se invoca a la función traductor_numero_cadena, con los siguientes parámetros"
	Escribir "chain: <<123>>", " ", "dic: <<abc>>"
	Escribir "(los caracteres de chain no tiene el formato del traductor)"
	Escribir "El resultado de la prueba"
	Escribir "newchain: <<",traductor_numero_cadena("123", "abc"), ">> "
	Escribir ""
	Esperar 1 segundos
	Escribir "Assert: FALSE"
	Escribir "Se invoca a la función traductor_numero_cadena, con los siguientes parámetros"
	Escribir "chain: <<asdf>>", " ", "dic: <<abc>>"
	Escribir "(los caracteres de chain no tiene el formato del traductor)"
	Escribir "El resultado de la prueba"
	Escribir "newchain: <<","<ERROR DE TIPO DE VALOR>", ">> "
	Escribir ""
FinFuncion

Funcion prueba4
	Escribir "PRUEBA:  Funcion chain <- eliminar_espacios ( chain )"
	Escribir "Función que elimina todos los espacios de una cadena de texto"
	Escribir "PARÁMETROS: "
	Escribir "chain - cadena: La cadena de texto que se le eliminan los espacios"
	Escribir "RETORNO: "
	Escribir "chain - cadena: La cadena de texto sin espacios"
	Escribir ""
	Esperar 1 segundos
	Escribir "Assert: TRUE"
	Escribir "Se invoca a la función formato_espacios, con los siguientes parámetros"
	Escribir "chain: <<    Holaaa     a    todo          el   Mundooo!   :3    >>"
	Escribir "El resultado de la prueba"
	Escribir "chain: <<",eliminar_espacios("    Holaaa     a    todo          el   Mundooo!   :3    "), ">> "
	Escribir ""
FinFuncion

Algoritmo proyecto
	falso_menu()	
	Limpiar Pantalla
	Escribir "A CONTINUACIÓN LAS PRUEBAS UNITARIAS"
	pausa(Verdadero)
	prueba1()
	pausa(Verdadero)
	prueba2()
	pausa(Verdadero)
	prueba3()
	pausa(Verdadero)
	prueba4()
	pausa(Verdadero)
FinAlgoritmo
