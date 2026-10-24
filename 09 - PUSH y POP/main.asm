INCLUDE Irvine32.inc

;Materia: Lenguajes de interfaz
;Alumno: Luis Fernando Velázquez Araujo
;Horario: 9:00/10:00 am
;Docente: Dr. José Luis Medina jiménez
;Practica: 9 - PUSH Y POP
;Descripción: Uso basico de la pila para guardar y recuperar valores

.data
mensaje BYTE "Hola, mundo!",0

.code 
main PROC
	; Bloque 1: push y pop
	mov eax, 40

	push eax

	nop
	mov eax, 0
	pop ebx
	nop
	; Bloque 2: Orden de Lifo
	mov eax, 10
	push eax

	mov eax, 20
	push eax 

	mov eax, 30
	push eax
	
	nop

	pop eax
	pop ebx
	pop ecx

	nop

	; Bloque 3: Conservar Registros

	mov eax, 100
	mov ebx, 200

	push eax
	push ebx

	mov eax, 999
	mov ebx, 666

	pop ebx
	pop eax

	nop

	; Bloque 4: Call y Ret

	mov eax, 50
	mov ebx, 100

	call aumentarDiez

	nop



	exit
main ENDP

aumentarDiez PROC

	push ebx
	mov ebx , 10
	add eax, ebx

	pop ebx
	ret
aumentarDiez ENDP

END main