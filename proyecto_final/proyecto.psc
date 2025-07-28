//Funcion de desencriptación de cadena
Funcion newchain <- desencriptar_cadena ( chain, coord )
	newchain = ""
	posicion = 1
	Mientras posicion < Longitud(chain) Hacer
		decrypt_frag = desencriptar_fragmento(Subcadena(chain, posicion + 4, posicion + 1 + ConvertirANumero(Subcadena(chain,posicion,posicion+1))), coord)
		si Longitud(decrypt_frag)/2 < 10 Entonces
			newchain = newchain + "0" + ConvertirATexto(Longitud(decrypt_frag)/2) + decrypt_frag
		SiNo
			newchain = newchain + ConvertirATexto(Longitud(decrypt_frag)/2) + decrypt_frag
		FinSi
		posicion = posicion + 2 + ConvertirANumero(Subcadena(chain, posicion, posicion + 1))
	Fin Mientras
	
Fin Funcion

//Funcion de encriptacion de cadena
Funcion encriptar_cadena ( chain, coord, newchain Por Referencia)
	si Longitud(chain) <> 0 Entonces
		newchain = newchain + encriptar_palabra(Subcadena(chain, 3, 2 + ConvertirANumero(Subcadena(chain,1,2))*2), coord)
		encriptar_cadena(Subcadena(chain, 3 + ConvertirANumero(Subcadena(chain,1,2))*2, Longitud(chain)), coord, newchain)
	FinSi
Fin Funcion

//Funcion de encriptación para cada palabra + BOM por fragmento + BOM por palabra
Funcion newchain <- encriptar_palabra ( chain, coord )
	newchain = ""
	Para i<-1 Hasta Longitud(chain) Con Paso 8 Hacer
		newchain = newchain + encriptar_fragmento(Subcadena(chain, i, 7+i), coord)
	Fin Para
	//FINAL BOM
	Si Longitud(newchain) < 10 Entonces
		newchain = "0" + ConvertirATexto(Longitud(newchain)) + newchain
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
	Escribir coeficiente, " ", independiente
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
Funcion newchain <- traductor_cadena_numero ( chain , dic )
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
			si j-i-1 < 10 Entonces
				newchain = newchain + "0" + ConvertirATexto(j-i-1)
			SiNo
				newchain = newchain + ConvertirATexto(j-i-1)
				
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
		newchain = newchain + traductor_numero_palabra(Subcadena(chain, 3, 2 + ConvertirANumero(Subcadena(chain,1,2))*2), dic)
		newchain = newchain + " " + traductor_numero_cadena(Subcadena(chain,3 + ConvertirANumero(Subcadena(chain,1,2))*2, Longitud(chain)), dic)
	FinSi
Fin Funcion

Algoritmo proyecto
	diccionario = "¿?*+-/@_.:;,AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrsSTtUuVvWwXxYyZz0123456789"
FinAlgoritmo
