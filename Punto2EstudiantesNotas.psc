SubProceso RegNotas(notasEstudiante)
	Definir i Como Entero
	Definir notaIngresada Como Real
	
	Para i <- 1 Hasta 3 Hacer
		Repetir
			Escribir "Ingrese la nota ", i, " (rango 0.0 a 5.0):"
			Leer notaIngresada
			Si (notaIngresada < 0 O notaIngresada > 5) Entonces
				Escribir "Nota inválida. Debe estar en el rango de 0 a 5. Intente de nuevo."
			FinSi
		Hasta Que (notaIngresada >= 0 Y notaIngresada <= 5)
		notasEstudiante[i] <- notaIngresada
	FinPara
FinSubProceso

Funcion prom <- CalcProm(notasEstudiante)
	Definir prom Como Real
	prom <- (notasEstudiante[1] + notasEstudiante[2] + notasEstudiante[3]) / 3
FinFuncion

Funcion estado <- DetEst(promedio)
	Definir estado Como Cadena
	Si promedio < 3.0 Entonces
		estado <- "Reprobado"
	Sino
		Si promedio >= 3.0 Y promedio <= 3.9 Entonces
			estado <- "Aprobado"
		Sino
			Si promedio >= 4.0 Y promedio <= 4.5 Entonces
				estado <- "Sobresaliente"
			Sino
				estado <- "Excelente"
			FinSi
		FinSi
	FinSi
FinFuncion

Funcion aproboTodas <- VerfNotInd(notasEstudiante)
	Definir aproboTodas Como Logico
	Si notasEstudiante[1] >= 3.0 Y notasEstudiante[2] >= 3.0 Y notasEstudiante[3] >= 3.0 Entonces
		aproboTodas <- Verdadero
	Sino
		aproboTodas <- Falso
	FinSi
FinFuncion

Algoritmo Punto2NotasEstudiantes
	Definir cantEst, i Como Entero
	Definir nombre Como Cadena
	Definir promedioActual, sumaPromedios Como Real
	Definir cantApro, cantRepro, cantAproboTodas Como Entero
	Definir maxPromedio, minPromedio Como Real
	Definir nombreMax, nombreMin Como Cadena
	Definir notEstud Como Real
	Dimension notEstud[3]
	cantApro <- 0
	cantRepro <- 0
	cantAproboTodas <- 0
	sumaPromedios <- 0
	maxPromedio <- 0 
	minPromedio <- 5  
	
	Escribir "Bienvenido al sistema de Registro de  Estudiantes, con sus notas."
	Escribir "Ingrese la cantidad de estudiantes a registrar:"
	Leer cantEst
	Mientras cantEst <= 0 Hacer
		Escribir "Por favor valide la cantidad de Estudiantes a registrar, debe ser mayor a 0."
		Escribir "Ingrese la cantidad de estudiantes a registrar:"
		Leer cantEst
	FinMientras

	Para i <- 1 Hasta cantEst Hacer
		Escribir "--"
		Escribir "Por favor ingrese el nombre del estudiante No. ", i, ":"
		Leer nombre
		RegNotas(notEstud)
		promAct <- CalcProm(notEstud)
		sumProm <- sumProm + promAct
		Escribir "______________________________________________"
		Escribir "Información registrada del estudiante: (",i,")"
		Escribir "Estudiante: ", nombre
		Escribir "Promedio: ", promAct
		Escribir "Estado Académico: ", DetEst(promAct)
		Si promAct >= 3.0 Entonces
			cantApro <- cantApro + 1
		Sino
			cantRepro <- cantRepro + 1
		FinSi
		
		Si VerfNotInd(notEstud) Entonces
			cantAproboTodas <- cantAproboTodas + 1
			Escribir "Aprobó las tres notas individualmente: ", Verdadero
			Escribir "______________________________________________"
		Sino
			Escribir "Aprobó las tres notas individualmente: ", Falso
			Escribir "______________________________________________"
		FinSi

		Si promAct > maxPromedio Entonces
			maxPromedio <- promAct
			nombreMax <- nombre
		FinSi
	
		Si promAct < minPromedio Entonces
			minPromedio <- promAct
			nombreMin <- nombre
		FinSi
	FinPara
	
	Escribir "Entrega Global de Resultado:"
	Escribir "  Cantidad de estudiantes que aprobaron son: ", cantApro
	Escribir "  Cantidad de estudiantes que reprobaron son: ", cantRepro
	Escribir "  Valor porcentual de estudiantes aprobados es de: ", (cantApro/cantEst) * 100, "%"
	Escribir "  Promedio general del grupo: ", (sumProm / cantEst)
	Escribir "  El Estudiante con el promedio más alto es: ", nombreMax, " con promedio de: (", maxPromedio, ")"
	Escribir "  El Estudiante con el promedio más bajo es: ", nombreMin, " con promedio de: (", minPromedio, ")"
	Escribir "  La cantidad de Estudiantes que aprobaron los tres (3) cortes son: ", cantAproboTodas
FinAlgoritmo