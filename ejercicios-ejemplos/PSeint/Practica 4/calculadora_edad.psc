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

Algoritmo calculadora_edad
	//Se define el valor de edad como entero
	Definir edad Como Entero
	//Se definen fecha_actual y fecha_nacimiento como cadenas para facilitar su uso
	Definir fecha_nacimiento, fecha_actual como cadena
	//Se genera un arreglo de 12 elementos para contener los meses (indice) y sus días
	Dimension meses[12]
	//Se inicializan el máximo de días que puede tener cada mes
	meses[1] = 31
	meses[2] = 28
	meses[3] = 31
	meses[4] = 30
	meses[5] = 31
	meses[6] = 30
	meses[7] = 31
	meses[8] = 31
	meses[9] = 30
	meses[10] = 31
	meses[11] = 30
	meses[12] = 31
	//Ciclo para no escapar si la cadena tiene caracteres inválidos
	Repetir
		Limpiar Pantalla
		//Se manda mensaje al usuario con las indicaciones
		Escribir "Ingrese su fecha de nacimiento en formato DD-MM-AAAA."
		//Se lee la fecha de nacimiento en cadena
		Leer fecha_nacimiento
	Hasta Que validar_cadena(fecha_nacimiento, "0123456789-") y (Longitud(fecha_nacimiento) = 10) y (Subcadena(fecha_nacimiento,3,3) = Subcadena(fecha_nacimiento,6,6)) y ("-" = Subcadena(fecha_nacimiento,6,6))
	//Se definen, día, mes y año como enteros para extraerse de la cadena fecha_nacimiento
	Definir dd,mm,aaaa Como Entero
	//Se extraen como enteros, las partes de la cadena relativas a, DD,MM y AAAAA. No se validan excepciones de tipo de valor, si la conversión falla el programa finaliza
	dd = ConvertirANumero(Subcadena(fecha_nacimiento,1,2))
	mm = ConvertirANumero(Subcadena(fecha_nacimiento,4,5))
	aaaa = ConvertirANumero(Subcadena(fecha_nacimiento,7,10))
	//Se definen día, mes y año de la fecha actual como entero
	Definir dd_actual, mm_actual, aaaa_actual Como Entero
	//Se extrae la fecha actual como cadena
	fecha_actual = ConvertirATexto(FechaActual())
	//Se agrupan las partes a su valor entero correspondiente
	aaaa_actual = ConvertirANumero(Subcadena(fecha_actual,1,4))
	mm_actual = ConvertirANumero(Subcadena(fecha_actual,5,6))
	dd_actual = ConvertirANumero(Subcadena(fecha_actual,7,8))
	Escribir ""
	//Condicional que valida que la fecha sea correcta en cuanto mes positivo y menor a 12, y año mayor a 1900 y menor al año actual
	si (mm > 12) o (mm < 1) o (aaaa <= 1900) o (aaaa >= aaaa_actual) Entonces
		//mensaje de error de acuerdo al año y mes
		Escribir "ERROR: Mes o Año incorrectos."
		Escribir "Debe ingresar una fecha válida (Verifique su calendario, sólo se aceptan fechas posteriores a 1900)."
	SiNo
		//Si el año y mes son correctos se valida el día del mes según el arreglo meses, días negativos o mayores a lo permitido en cada mes (28 para febrero) probocarán una excepción
		Si (dd < 1) o (dd > meses[mm]) Entonces
			Escribir "ERROR: Día del mes incorrecto."
			Escribir "Debe ingresar una fecha válida (Verifique su calendario)."
		SiNo
			//Si el día es correcto se calcula la edad, primero se inicializa la edad como la diferencia de los años actual y el de nacimiento
			edad = aaaa_actual-aaaa
			//Si la fecha actual excede la fecha de nacimiento entonces su edad esta bien, si no hay que corregir en 1 año
			si (dd <= dd_actual) y (mm <= mm_actual) Entonces
				//Se valida si la fecha es su cumpleaós
				si (dd = dd_actual) y (mm = mm_actual) Entonces
					//Mensaje de cumpleaños
					Escribir "¡Feliz cumpleaños! Tu edad actual es: ", edad," años"
				SiNo
					//se muestra su edad
					Escribir "Su edad actual es: ", edad, " años"
				FinSi
			SiNo
				//Se corrige la edad porque aun no pasa su cumpleños
				Escribir "Su edad actual es: ", edad - 1, " años"
				FinSi
			FinSi
		FinSi
FinAlgoritmo
