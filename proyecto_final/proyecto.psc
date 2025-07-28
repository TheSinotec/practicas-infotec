//Cifrado
Funcion cifrar
	Escribir "Para comenzar se requiere que tenga al menos dos llaves de cifrado a la mano."
	Escribir "Si no las tiene, genérelas en el menú anterior. Puede escapar de esta pantalla en todo momento digitando: X"
	Escribir "Presione una tecla para continuar:"
	Esperar Tecla
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
				Escribir "Presione una tecla para continuar:"
				entrada = ""
				Esperar Tecla
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
		Escribir "Presione para continuar.."
		Esperar Tecla
		Repetir
			Limpiar Pantalla
			dato = ""
			Escribir "Ingrese una linea de texto o digite & para salir:"
			Leer entrada
			//exploit Pseint
			entrada = limpiar_cadena(entrada, diccionario)
			entrada = limpiar_cadena(entrada, diccionario)
			entrada = limpiar_cadena(entrada, diccionario)
			entrada = limpiar_cadena(entrada, diccionario)
			Si entrada <> "" Entonces
				Repetir
					Limpiar Pantalla
					Escribir "El programa considerará la siguiente linea:"
					entrada = limpiar_cadena(entrada, diccionario)
					Escribir entrada
					Escribir ""
					Escribir "¿Desea continuar? [S/N]"
					Leer dato
				Hasta Que Mayusculas(dato) = "S" o Mayusculas(dato) = "N"
				Segun dato Hacer
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
							Escribir  "Su texto fue cifrado y sólo podrá ser recuperado con dos de las tres llaves, su mensaje ahora es:"
							Escribir final
							Esperar Tecla
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
	Escribir "Presione cualquier tecla para comenzar:"
	Esperar Tecla
	Limpiar Pantalla
	Definir menu como cadena
	Repetir
		Escribir "Ingrese una opción:"
		Escribir ""
		Escribir "LLAVES: Para obtener 3 llaves diferentes y únicas de encriptación (se requieren 2 llaves diferentes para el proceso de cifrado y decifrado)."
		Escribir ""
		Escribir "CIFRAR: Para cifrar un texto."
		Escribir ""
		Escribir "DESCIFRAR: Para cifrar un texto."
		Escribir ""
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
				Escribir "Presione una tecla para continuar:"
				Esperar Tecla
				Limpiar Pantalla
			"CIFRAR":
				Limpiar Pantalla
				cifrar()
			"DESCIFRAR":
				Limpiar Pantalla
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
	Escribir "Presione cualquier tecla para comenzar:"
	Esperar Tecla
	Limpiar Pantalla
	Definir menu como cadena
	Repetir
		Escribir "Ingrese una opción:"
		Escribir "HORA: Para obtener la hora local."
		Escribir "FECHA: Para obtener la fecha."
		Escribir "SALIR: Para obtener la salir del programa."
		Leer menu
		Segun Mayusculas(menu) Hacer
			"HORA":
				Limpiar Pantalla
				Escribir "La hora exacta es: " + Subcadena(ConvertirATexto(HoraActual()),1,2) + ":" + Subcadena(ConvertirATexto(HoraActual()),3,4)
				Escribir ""
			"FECHA":
				Limpiar Pantalla
				Escribir "La fecha de hoy es: " + Subcadena(ConvertirATexto(FechaActual()),7,8) + "/" + Subcadena(ConvertirATexto(FechaActual()),5,6) + "/" + Subcadena(ConvertirATexto(FechaActual()),1,4)
				Escribir ""
			"SECRETO":
				Limpiar Pantalla
				//inicia la fiesta
				real_menu()
			"SALIR":
				menu = Mayusculas(menu)
			De Otro Modo:
				Limpiar Pantalla
				Escribir "ATENCIÓN: OPCIÓN INVÁLIDA"
		Fin Segun
	Hasta Que menu = "SALIR"
Fin Funcion

//Funcion de restricción de caracteres
Funcion newchain <- limpiar_cadena ( chain, dic )
	newchain = formato_espacios(chain)
	Para i<-1 Hasta Longitud(newchain) Con Paso 1 Hacer
		bandera_caracter = Falso
		Para j<-1 Hasta Longitud(dic) Con Paso 1 Hacer
			si (Subcadena(newchain, i, i) = Subcadena(dic, j, j)) O (Subcadena(newchain, i, i) = " ") Entonces
				bandera_caracter = Verdadero				
			FinSi
		Fin Para
		si bandera_caracter = Falso Entonces
			newchain = Subcadena(newchain, 1, i-1) + Subcadena(newchain, i+1, Longitud(newchain))
		FinSi
	Fin Para
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
		Escribir "newchain: ", newchain
		Escribir "chain: ", chain
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

//Obtención de coordenadas según las dos llaves //VALIDAR 0ros
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
			Mientras Subcadena(chain,i,i) <> Subcadena(dic, j, j)  Hacer
				j = j + 1
			Fin Mientras
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

Algoritmo proyecto
	diccionario = "¿?!¡*+-=/@#%$_.:;,AaBbCcDdEeFfGgHhIiJjKkLlMmNnÑñOoPpQqRrsSTtUuVvWwXxYyZz0123456789()[]{}"
	falso_menu()
FinAlgoritmo
