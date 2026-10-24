INCLUDE Irvine32.inc

;Materia: Lenguajes de interfaz
;Alumno: Luis Fernando Velázquez Araujo
;Horario: 9:00/10:00 am
;Docente: Dr. José Luis Medina jiménez
;Practica: 6 - Control de ocupacion de estacionamiento
;Descripción: Control de ingresos y salidas en un estacionamiento con validacion de cupos

.data
msgInicial BYTE "BIENVENIDO AL SISTEMA GESTOR DEL ESTACIONAMIENTO", 0
msgEspaciosLibres BYTE "Cantidad de espacios libres actualmente: ", 0 
msgLleno BYTE "NO SE PUEDE INGRESAR EL ESTACIONAMIENTO ESTA LLENO", 0
msgCerrar BYTE "El programa se cerrara, gracias por usar el sistema", 0
msgInstruccion BYTE "Por favor ingrese un 1 para ingresar un auto, 2 para extraer un auto y 0 para salir del programa", 0
msgVacio BYTE "NO PUEDE SACAR MAS AUTOS, EL ESTACIONAMIENTO ESTA VACIO", 0

espaciosMaximos = 10
espaciosLibres DWORD ?

.code 
main PROC
	mov espaciosLibres, espaciosMaximos		;Inicializacion de los espacios libres en 10
	mov edx, OFFSET msgInicial
	call WriteString
	call Crlf

Ciclo:										;Etiqueta para ciclarlo
	mov edx, OFFSET msgEspaciosLibres
	call WriteString


	mov eax, espaciosLibres
	call WriteDec
	call Crlf
	mov edx, OFFSET msgInstruccion
	call WriteString
	call Crlf
	call ReadInt
	cmp eax, 1
	je Agregar
	cmp eax, 2
	je Quitar
	jmp Salir


Agregar:						;Reduce en 1 los espacios libres
	cmp espaciosLibres, 0
	je Lleno
	DEC espaciosLibres
	jmp Ciclo
Lleno:							;Etiqueta para cuando no se puede ingresar por cupos maximos alcanzados
	mov edx, OFFSET msgLleno
	call WriteString
	call Crlf
	jmp Salir
Vacio:							;Etiqueta para cuando no se puede sacar otro auto porque ya no hay
	mov edx, OFFSET msgVacio
	call WriteString
	call Crlf
	jmp Ciclo
Quitar:							;Aumenta en 1 los espacios libres
	cmp espaciosLibres, 10
	je Vacio
	INC espaciosLibres
	jmp Ciclo
Salir:							;Fin del programa
	mov edx, OFFSET msgCerrar
	call WriteString
	call Crlf
	exit

main ENDP
END main