INCLUDE Irvine32.inc

;Materia: Lenguajes de interfaz
;Alumno: Luis Fernando Velázquez Araujo
;Horario: 9:00/10:00 am
;Docente: Dr. José Luis Medina jiménez
;Practica: 8 - Operaciones aritmeticas
;Descripción: Uso de ADD, SUB, MUL, IMUL, DIV, IDIV, CDQ

.code 
main PROC
	; 01 - ADD y SUM

	mov eax, 50
	mov ebx, 20
	
	add eax, ebx
	sub eax, 15

	nop

	;2 CF: ACARREO EN UNA SUMA SIN SIGNO
	mov eax, 0
	mov al, 255

	add al, 1

	;3 OF: DESBORDAMIENTO EN UNA SUMA CON SIGNO

	mov eax, 0
	mov al, 127

	add al, 1

	nop

	; 4. MUL: PRODUCTO DENTRO DE 32 BITS.

	mov eax, 65532
	mov ebx, 65532

	mul ebx

	; IMUL: PRODUCTO CON SIGNO

	mov eax, -5 

	imul eax, eax, 3

	nop

	; DIV: DIVIDIENDO VALORES PEQUEÑOS SIN SIGNO
	
	mov eax, 125	;Dividendo guardado en eax
	mov edx, 0		;Residuo se guardará en edx
	mov ebx, 12	;Divisor guardado en ebx
	div ebx
	nop

	; IDIV Y CDQ: DIVISION CON SIGNO
	mov eax, -125
	cdq 

	mov ebx, 12
	idiv ebx

	nop 

	exit
main ENDP
END main