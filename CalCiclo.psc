Algoritmo CalCiclo
	Escribir "Ingrese el número de la opción, acorde a la operación que desea realizar y oprima la tecla ENTER:"
	Escribir "1 Sumar"
	Escribir "2 Restar"
	Escribir "3 Multiplicar"
	Escribir "4 Dividir"
	leer opc
	Escribir "Por favor dígite la cantidad de números que desee operar"
	Leer cant
	Definir opera Como Real
	Si opc==3 Entonces
		opera=1
	FinSi
	Para i<-1 Hasta cant Hacer
		Si opc==1 Entonces
    		Escribir "A seleccionado la opción de Suma:"
			Escribir "A continuación ingrese el número a operar y oprima la tecla ENTER"
            Leer num
			opera<- opera + num
    	FinSi			
    	Si opc==2 Entonces
    		Escribir "A seleccionado la opción de Resta:"
			Escribir "A continuación ingrese el  número a operar y oprima la tecla ENTER"
            Leer num
			opera=opera-num
        FinSi
    	Si opc==3 Entonces
			Escribir "A seleccionado la opción de Multiplicación:"
			Escribir "A continuación ingrese el  número a operar y oprima la tecla ENTER"
            Leer num
			opera<- opera* num
        FinSi
		Si opc==4 Entonces
            Escribir "A seleccionado la opción de División:"
			Escribir "A continuación ingrese el primer número a operar y oprima la tecla ENTER"
			Leer num
			Si opera==0 Entonces
				opera=num
			SiNo
				opera<-opera/num
			FinSi
        FinSi
	FinPara
	Escribir "La operación es:", opera
	
FinAlgoritmo
