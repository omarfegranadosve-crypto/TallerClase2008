Funcion r<-restar(num1,num2) 
	r<-num1-num2
FinFuncion
Funcion r<-sumar(num1,num2) 
	r<-num1+num2
FinFuncion
Funcion r<-Multiplica(num1,num2) 
	r<-num1*num2
FinFuncion

Funcion r<-Divis(num1,num2) 
	Si num2=0 Entonces
		r<-0
	SiNo
		r<-num1/num2
	FinSi
FinFuncion
Algoritmo PuntoNo2Taller
	Definir num1,num2 Como Real
	Escribir "Por favor ingrese los dos numeros sumar, restar, Multiplicar y Dividir"
	Escribir "Ingrese el primer número"
	Leer num1
	Escribir "Ingrese el Segundo número"
	Leer num2
	Escribir "El resultado de la suma es: ",sumar(num1,num2)
	Escribir "El resultado de la resta en la forma (",num1,")-(",num2,")=: ",restar(num1,num2)
	Escribir "El resultado de la Multiplicación es: ",Multiplica(num1,num2)
	Escribir "El resultado de la División es: ",Divis(num1,num2)
FinAlgoritmo