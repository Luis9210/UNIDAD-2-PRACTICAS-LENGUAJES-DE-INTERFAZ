INCLUDE Irvine32.inc

;Materia: Lenguajes de interfaz
;Alumno: Luis Fernando Velázquez Araujo
;Horario: 9:00/10:00 am
;Docente: Dr. José Luis Medina jiménez
;Practica: 4.1 Mayor, menor o igual con entrada del usuario
;Descripción: Comparacion entre 2 numeros ingresados por consola

.data
mensajeNum1 BYTE "Ingrese el num1: ", 0
mensajeNum2 BYTE "Ingrese el num2: ", 0
msgmayor BYTE "El num1 es mayor", 0
msgmenor BYTE "El num1 es menor", 0
msgigual BYTE "Los numeros son iguales", 0

num1 DWORD ?
num2 DWORD ?


.code 
main PROC
	mov edx, OFFSET mensajeNum1
	call WriteString
	
	mov edx, OFFSET num1		;Leer num 1
	call ReadInt
	mov num1,eax
	call Crlf

	mov edx, OFFSET mensajeNum2
	call WriteString

	mov edx, OFFSET num2		;Leer num 2
	call ReadInt
	mov num2, eax
	call Crlf

	mov eax, num1
	mov ebx, num2

	cmp eax, ebx			;Comparacion entre los numeros
	
	jg mayor				;saltos condicionales
	jl menor
	je igual

mayor:							;Etiquetas de cada situacion con su mensaje impreso por consola
	mov edx, OFFSET msgmayor
	call WriteString
	jmp fin

menor:
	mov edx, OFFSET msgmenor
	call WriteString
	jmp fin

igual:
	mov edx, OFFSET msgigual
	call WriteString
	jmp fin


fin:
	call Crlf
	exit
main ENDP
END main