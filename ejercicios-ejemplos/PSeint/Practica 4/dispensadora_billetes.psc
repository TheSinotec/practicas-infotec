//Funcion auxiliar para calcular el monto máximo posible del dispensador
//Recibe el inventario y regresa el monto máximo como entero
Funcion maximo <- calcular_maximo ( inv por referencia )
	//Se define el valor máxmimo como entero y se inicializa en cero
	Definir maximo Como Entero
	maximo = 0
	//Ciclo para obtener el monto máximo del inventario
	Para i<-1 Hasta 6 Con Paso 1 Hacer
		//Se multiplican valores por existencias y se hace el acumulado
		maximo = maximo + inv[i,1]*inv[i,2]
	Fin Para
Fin Funcion

//Funcion auxiliar que genera la operación de retiro
//Recibe una cantidad y un inventario, y no regresa nada
Funcion retirar ( cant Por Referencia, inv por referencia )
	//Se definen dos arreglos de 6 elementos. indicador, para almacenar la cantidad de existencias empleada en cada paso de la operación
	Dimension indicador[6]
	//Se definen dos cantidades enteras: total, para generar una copia del valor ingresado; j, para el entero mínimo anterior acota la cantidad dada
	Definir j, total Como Entero
	//se genera una copia de la cantidad dada
	total = cant
	//Ciclo para "tomar" billetes desde las denominaciones más altas
	Para i<-6 Hasta 1 Con Paso -1 Hacer
		//Se hace la división entera de la cantidad por la denominación
		j = trunc(cant/inv[i,1])
		//Condicional que valida la cantidad de existencias
		si j >= inv[i,2] Entonces
			//Si no hay existencia suficiente a la necesaria, se toma el máximo de existencia
			indicador[i] = inv[i,2]
		SiNo
			//Si hay existencias suficientes se toma lo necesario únicamente
			indicador[i] = j
		FinSi
		//Se le resta a la cantidad el valor acumulado de los billetes a retirar
		cant = cant - inv[i,1] * indicador[i] 
	Fin Para
	//Condicional que evalúa el resto de la operación y con base en ello cancela o mantiene la operación
	si cant = 0 Entonces
		//Si el resto es cero, hay existencias y denominaciones para la operación. Se borra la pantalla y se manda mensaje de exito
		Limpiar Pantalla
		Escribir "OPERACION EXITOSA: A continuación se hace un desglose del movimiento."
		Escribir ""
		//Ciclo para presentar el desglose de la operación
		Para i<-1 Hasta 6 Con Paso 1 Hacer
			//Condicional que no envía denominaciones no usadas
			si indicador[i] <> 0 Entonces
				//Se presentan las denominaciones usadas y el acumulado
				Escribir indicador[i], " * $", inv[i,1], " = $", indicador[i]*inv[i,1]
			FinSi
			//Se actualiza el inventario con el resto de la operación
			inv[i,2] = inv[i,2] - indicador[i]
		Fin Para
		//se muestra el valor total
		Escribir "---------------------------------------------------------------------"
		Escribir "TOTAL: $", total
		Escribir ""
	SiNo
		//Se limpia pantalla y se muestra el mensaje de operación cancelada, no se actualiza el inventario
		Limpiar Pantalla
		Escribir "OPERACION CANCELADA: El cajero no dispone con las denominaciones necesarias para cumplir su petición."
		Escribir "Ningun billete fue retirado de su cuenta."
		Escribir ""
	FinSi
Fin Funcion

//Función que muestra en pantalla el inventario actual
//Recibe el inventario como parámetro y no regresa ningun valor
Funcion mostrar_inventario ( inv Por Referencia )
	//Se limpia la pantalla y se recorre el inventario, mostrando denominaciones y existencias
	Limpiar Pantalla
	Escribir "El inventario actual es:"
	Para i<-1 Hasta 6 Con Paso 1 Hacer
		Escribir "$",inv[i,1], ": ", inv[i,2]
	Fin Para
	Escribir ""
Fin Funcion

//Algoritmo dispensadora de billetes
Algoritmo dispensadora_billetes
	//Se genera un arreglo matricial de 6x2, para contener denominaciones y existencias 
	Dimension inventario[6,2]
	//se inicializan las denominaciones permitidas
	inventario[1,1] = 20
	inventario[2,1] = 50
	inventario[3,1] = 100
	inventario[4,1] = 200
	inventario[5,1] = 500
	inventario[6,1] = 1000
	//Se inicializa en 10 cada una de las existencias
	Para Cada x de inventario
		si x = 0 Entonces
			x = 10
		FinSi
	FinPara
	//Se define maximo_retiro como entero, un valor que representa el valor máxmimo que contiene el inventario
	Definir maximo_retiro Como Entero
	//Se define la cantidad a ingresar como valor real para evitar confusiones de punto decimal (100.00)
	Definir cantidad Como Real
	//Se presenta el cajero
	Escribir "Bienvenido al cajero, para empezar, digite una clave del menú."
	//Se define una variable menú como cadena, para recibir la entrada del usuario
	Definir menu como cadena
	//Ciclo para mantener en el menú hasta que la instrucción sea "SALIR"
	Repetir
		//Se manda mensaje del menú principal
		Escribir "Elija una opción."
		Escribir "INVENTARIO: Para consultar la existencia de billetes."
		Escribir "RETIRAR: Para retirar efectivo."
		Escribir "SALIR: Para finalizar la transacción."
		Escribir ""
		//Se lee la respuesta del usuario
		Leer menu
		//Switch para verificar las opciones dadas por la variable leída (menu). Se ignoran MAYUS/MINUS
		Segun Mayusculas(menu) Hacer
			"INVENTARIO":
				//Llama a la función mostrar_inventario con el inventario actual, para mostrar inventario actual
				mostrar_inventario(inventario)
			"RETIRAR":
				//Se calcula el monto máximo de retiro mediante la fucnión calcular_máximo según el inventario actual
				maximo_retiro = calcular_maximo(inventario)
				Limpiar Pantalla
				//Ciclo de recepción de cantidad y validación de valores, cantidad debe ser positivo
				Repetir
					//Mensaje al usuario
					Escribir "Ingrese una cantidad a retirar (0 para volver al menú):"
					//Se lee la cantidad de usuario (No se validan excepciones por tipos diferentes a número).
					Leer cantidad
					//Se valida si la opción del ususario es "0", que es a su vez un escape a la operación
					Si cantidad = 0 Entonces
						//Se borra pantalla y se da un valor reservado fuera de la valicación interna para generar un escape de la validación
						Limpiar Pantalla
						cantidad = 19000
					SiNo
						//Si no es el valor reservado "0", se considera una opción real y se valida.
						//Se valida que sea valor entero, multiplo de 10 y mayor a 20
						si (TRUNC(cantidad) <> cantidad) o (TRUNC(cantidad)%10 <> 0) o (TRUNC(cantidad) < 20) Entonces
							//Si no cumple alguno de los criterios se manda una excepción y se pide de nuevo una cantidad
							Limpiar Pantalla
							//Se reinicia cantidad a 0
							cantidad = 0
							Escribir "Este cajero no emite centavos o cantidades que no sean múltiplo de $10 o menores que $20, intente una cantidad válida."
							Escribir ""
						SiNo
							//Si cumple los criterios, se valida que la cantidad no sea mayor al monto máximo del inventario
							si maximo_retiro < cantidad Entonces
								//Se reinicia cantidad a 0
								cantidad = 0
								//Se validan dos casos
								si maximo_retiro <> 0 Entonces
									//Si la cantidad es mayor al monto máximo se manda el mensaje con el máximo
									Escribir "Este cajero sólo dispone de $", maximo_retiro
									Escribir  "La operación fue cancelada, intente nuevamente con otra cantidad"
								SiNo
									//Si monto máximo es cero, se manda el error y se regresa al menu
									Escribir "Este cajero NO TIENE FONDOS"
									Escribir  "La operación fue cancelada."
									//valor reservado de escape
									cantidad = 19000
								FinSi
								Escribir ""
							FinSi
						FinSi
					FinSi
				Hasta Que cantidad > 0
				//Valida la cantidad reservada, si es 19000 se sale y vuelve al menu, si no, intenta retirar los fondos
				si cantidad <> 19000
					//Se llama a ña función retirar, con la cantidad validada y el inventario actual
					retirar(cantidad,inventario)
				FinSi
			"SALIR":
				//Actualiza menú para ignorar diferencias mayus/minus y para asegurar la salida del programa
				menu = Mayusculas(menu)
			De Otro Modo:
				//Se manda mensaje de error por excepción
				Limpiar Pantalla
				Escribir "La opción es incorrecta."
				Escribir "Verifique en no colocar espacios y digitar correctamente las palabras del menú."
		Fin Segun
	Hasta Que menu = "SALIR"
FinAlgoritmo
