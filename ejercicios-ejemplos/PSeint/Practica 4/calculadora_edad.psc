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
	//Se manda mensaje al usuario con las indicaciones
	Escribir "Ingrese su fecha de nacimiento en formato DD-MM-AAAA. Si no se sigue el formato podría provocar un excepción (no hay validaciones para tipo de valor)"
	//Se lee la fecha de nacimiento en cadena
	Leer fecha_nacimiento
	//Se definen, día, mes y año como enteros para extraerse de la cadena fecha_nacimiento
	Definir dd,mm,aaaa Como Entero
	//Condicional que verifica que la cadena contenga 10 caracteres, que los elementos para los guiones sean iguales y que sean guiones
	si (Longitud(fecha_nacimiento) = 10) y (Subcadena(fecha_nacimiento,3,3)=Subcadena(fecha_nacimiento,6,6)) y ("-" = Subcadena(fecha_nacimiento,6,6)) Entonces
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
	SiNo
		//La fecha no cumple con el formato DD-MM-AAAA
		Escribir "La fecha no coincide con el formato DD-MM-AAAA, intentelo de nuevo."
	FinSi
FinAlgoritmo
