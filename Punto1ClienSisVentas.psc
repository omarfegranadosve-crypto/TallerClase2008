Funcion sub <- CalcSubtot(precio, cantidad)
    sub <- precio * cantidad
FinFuncion


Funcion totIVA <- CalTotIVA(subtotal)
    totIVA <- subtotal * 1.19
FinFuncion

Algoritmo Punto1ClienSisVentas
	
    Definir cant,cl Como Entero
    Definir sumaTotal Como Real
    cant <- 10
    Escribir "Bienvenido al sistema de ingreso de Clientes y productos."
	Escribir "En este sistema se solicitara inicialmente la cantidad de clientes que atenderá (números Enteros)"
	Escribir "Ingrese cuantos clientes atendera"
	Leer cl
    Dimension client[cl]
    Dimension prod[cant]
    Dimension prec[cant]
    Dimension cantidad[cant]
    Dimension subtotProd[cant]
    Dimension totalProd[cant]
    Para j<-1 Hasta cl Hacer	
		Escribir "Por Favor ingrese el Nombre del Cliente (",j,")"
		Leer client[j]
		Escribir "Por favor, ingrese cuántos productos quiere registrar:"
		Leer cant
		Para i <- 1 Hasta cant Hacer
			Escribir "Por favor ingrese el Producto No: (", i, ")"
			Escribir "Ingrese el nombre del producto:"
			Leer prod[i]
			Escribir "Ingrese el precio unitario:"
			Leer prec[i]
			Escribir "Ingrese la cantidad:"
			Leer cantidad[i]
        
			subtotProd[i] <- CalcSubtot(prec[i], cantidad[i])
			totalProd[i] <- CalTotIVA(subtotProd[i])
			sumaTotal <- sumaTotal + totalProd[i]
		FinPara
	FinPara
	Escribir "El total de Clientes atendidos es: ",cl
    Escribir ""
	Para j<-1 Hasta cl Hacer
	Escribir "Nombre del cliente ,(",j,") es: ",client[j]	
    Para i <- 1 Hasta cant Hacer
        Escribir "Producto ", i, ": ", prod[i]
        Escribir "   Val Unitario $",prec[i]
        Escribir "   cantidad  ", cantidad[i]
        Escribir "   Subtotal: $", subtotProd[i]
        Escribir "   Total con IVA (19%): $", totalProd[i]
    FinPara
	FinPara
    Escribir "VALOR TOTAL A PAGAR POR LA COMPRA: $", sumaTotal
    Escribir "Gracias por usar el sistema de Registro y total de Compra"
    
FinAlgoritmo