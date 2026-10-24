INCLUDE Irvine32.inc

;Materia: Lenguajes de interfaz
;Alumno: Luis Fernando Velázquez Araujo
;Horario: 9:00/10:00 am
;Docente: Dr. José Luis Medina jiménez
;Practica: 11 - Operaciones logicas
;Descripción: Operaciones logicas simples para Activar/desactivar, checar y copiar estados

;ESTADOS DE COMPUTADORA
; 0 - COMPUTADORA ENCENDIDA	
; 1 - ALARMA
; 2 - COMPUTADORA ESTA CONECTADA
.data
alarmaEncendidaMsg BYTE "Alarma esta encendida", 0
alarmaApagadaMsg BYTE "Alarma esta apagada", 0
msg1 BYTE "AND", 0
msg2 BYTE "OR", 0
msg3 BYTE "XOR", 0
msg4 BYTE "TEST", 0




.code 
main PROC
;1 - AND: Evaluación de alarma
	mov edx, OFFSET msg1
	call WriteString
	call Crlf
	mov eax, 0
	mov al, 00000101b
	and al, 00000010b		;Máscara de alarma
	call WriteBin
	call Crlf
;2 - OR: Encender Alarma
	mov edx, OFFSET msg2
	call WriteString
	call Crlf
	mov eax, 0
	mov al, 00000101b	
	or al, 00000010b		;Máscara de alarma
	call WriteBin
	call Crlf
;3 - XOR: Apagar computadora y encenderla
; Estado Inicial: 00000101
	mov edx, OFFSET msg3
	call WriteString
	call Crlf
	mov eax, 0
	mov al, 00000101b
	xor al, 00000001b		;Máscara de computadora encendida
	call WriteBin
	call Crlf
	xor al, 00000001b		;Máscara de computadora encendida
	call WriteBin
	call Crlf


;4 - TEST: Evaluar alarma encendida y apagada 
;Realizar salto y mostrar mensaje de: "Alarma está encendida"
;o "Alarma está apagada"
	mov edx, OFFSET msg4
	call WriteString
	call Crlf
	mov eax, 0
	mov al, 00000101b
	test al, 00000010b
	call WriteBin
	call Crlf
	test al, 00000010b
	jne alarmaEncendida
	jmp alarmaApagada

alarmaEncendida:
	mov edx, OFFSET alarmaEncendidaMsg
	call WriteString
	call Crlf
	jmp fin
alarmaApagada:
	mov edx, OFFSET alarmaApagadaMsg
	call WriteString
	call Crlf
	jmp fin
fin:
	exit
main ENDP
END main