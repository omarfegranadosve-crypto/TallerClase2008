Funcion sub <- CalcSubtot(precio, cantidad)
    Definir sub Como Real
    sub <- precio * cantidad
FinFuncion

Funcion desc<-totaldesc(descuento)
 desc<-descuento
FinFuncion

Funcion porcDesc <- PorDescuento(subtotalCompra)
    Definir porcDesc Como Real
    Si subtotalCompra >= 300000 Entonces
        porcDesc <- 0.10
    Sino
        Si subtotalCompra >= 100000 Y subtotalCompra < 300000 Entonces
            porcDesc <- 0.05
        Sino
            porcDesc <- 0.00
        FinSi
    FinSi
FinFuncion

Funcion totIVA <- CalTotIVA(subtotal)
    Definir totIVA Como Real
    totIVA <- subtotal * 0.19 
FinFuncion

Algoritmo Punto1ClienSisVentas
    
    Definir cl, maxProd, i, j Como Entero
    Definir sumaTotal, promedioCompra, mayorValorCompra Como Real
    Definir clienteMayorCompra Como Caracter
    
    Escribir "Bienvenido al sistema de ingreso de Clientes y productos."
    Escribir "Ingrese cuántos clientes atenderá:"
    Leer cl
    maxProd<-100

    Dimension nomclient[cl]
    Dimension subtotalCliente[cl]
    Dimension descuentoCliente[cl]
    Dimension ivaCliente[cl]
    Dimension totalCliente[cl]
    Dimension totDesc[cl]

    Dimension prod[cl, maxProd]
    Dimension prec[cl, maxProd]
    Dimension cantidad[cl, maxProd]
    Dimension subtotProd[cl, maxProd]
    Dimension prodDesc[cl, maxProd]
    Dimension totalProd[cl, maxProd]
    Dimension cantProdPorCliente[cl]

    sumaTotal <- 0
    mayorValorCompra <- -1 
    clienteMayorCompra <- ""
    

    Para j <- 1 Hasta cl Hacer    
        Escribir "Registre al CLIENTE NO. ", j
        Escribir "Por Favor ingrese el Nombre del Cliente:"
        Leer nomclient[j]       
        subtotalCliente[j] <- 0
        descuentoCliente[j] <- 0
        ivaCliente[j] <- 0
        totalCliente[j] <- 0
        Repetir
            Escribir "¿Cuántos productos quiere registrar para ", nomclient[j] "?:"
            Leer cantProdPorCliente[j]
            Si cantProdPorCliente[j] > maxProd Entonces
                Escribir "Error: Supera el límite máximo de productos permitido."
            FinSi
        Hasta Que cantProdPorCliente[j] <= maxProd
        
        Para i <- 1 Hasta cantProdPorCliente[j] Hacer
            Escribir "-> Producto No: (", i, ")"
            Escribir "Ingrese el nombre del producto:"
            Leer prod[j, i]
            Escribir "Ingrese el precio unitario:"
            Leer prec[j, i]
            Escribir "Ingrese la cantidad:"
            Leer cantidad[j, i]
            
            subtotProd[j, i] <- CalcSubtot(prec[j, i], cantidad[j, i])
            prodDesc[j, i] <- PorDescuento(subtotProd[j, i])
            totDesc[j]<- totaldesc(prodDesc[j, i])
            subtotalCliente[j] <- subtotalCliente[j] + subtotProd[j, i]
            descuentoCliente[j] <- descuentoCliente[j] + (subtotProd[j, i] * prodDesc[j, i])
            ivaCliente[j] <- ivaCliente[j] + CalTotIVA(subtotProd[j, i])
        FinPara
        totalCliente[j] <- subtotalCliente[j] + ivaCliente[j] - descuentoCliente[j]
        sumaTotal <- sumaTotal + totalCliente[j]

        Si totalCliente[j] > mayorValorCompra Entonces
            mayorValorCompra <- totalCliente[j]
            clienteMayorCompra <- nomclient[j]
        FinSi
    FinPara
    Para j <- 1 Hasta cl Hacer  
        Escribir "     "
        Escribir "Recibos Generales de los clientes"
        Escribir " CLIENTE: ", nomclient[j]
        Escribir "     "
        Escribir "Subtotal acumulado:   $", subtotalCliente[j]
        Escribir "El porcentaje de descuento aplicado es; ",prodDesc[j, j]*100, "%"
        Escribir "Descuento aplicado:  -$", descuentoCliente[j]
        Escribir "Valor de IVA (19%):   +$", ivaCliente[j]
        Escribir "TOTAL A PAGAR:  $", totalCliente[j]

    FinPara

    promedioCompra <- sumaTotal / cl
    Escribir "   "
    Escribir " REPORTE DE VENTAS DEL DÍA: "
    Escribir "   "
    Escribir " Número de clientes atendidos: ", cl
    Escribir " Valor total vendido en el día: $", sumaTotal
    Escribir " Promedio de compra por cliente: $", promedioCompra
    Escribir " Cliente con la compra de mayor valor: ", clienteMayorCompra, " por valor de ($", mayorValorCompra, ")"
    Escribir "         "
    
FinAlgoritmo
