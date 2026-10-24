INCLUDE Irvine32.inc

;Materia: Lenguajes de interfaz
;Alumno: Luis Fernando Velázquez Araujo
;Horario: 9:00/10:00 am
;Docente: Dr. José Luis Medina jiménez
;Practica: 6 - Control de acceso DECREMENTO
;Descripción: Comparacion con un pin de acceso leido por consola

.data
msgPIN BYTE "Ingrese el PIN de acceso: ", 0

msgError BYTE "***PIN INCORRECTO***", 0
msgAcceso BYTE "ACCESO PERMITIDO.", 0
msgIntentos BYTE "Intentos restantes: ", 0
msgBloqueo BYTE "********************************Se ha bloqueado el sistema por exceso de intentos********************************", 0

pinCorrecto = 1234

.code 
main PROC
	mov ebx, 3

inicio:
	mov edx, OFFSET msgPIN		
	call WriteString
	call ReadInt
	call Crlf
	cmp eax, pinCorrecto	;Se compara el pin leido con el correcto

	je acceso    ;-JUMP----> ACCESO

	DEC ebx					;Reduccion de intentos restantes
	mov edx, OFFSET msgError
	call WriteString
	call Crlf

	mov edx, OFFSET msgIntentos	;Se muestran los intentos restantes
	call WriteString
	mov eax, ebx
	call WriteDec
	call Crlf

	cmp ebx, 0					
	je bloqueo     ;-JUMP----->BLOQUEO
	jmp inicio     ;-JUMP----->INICIO


acceso:							;Confirmacion de acceso
	mov edx, OFFSET msgAcceso
	call WriteString
	call Crlf
	exit

bloqueo:						;Confirmacion de bloqueo
	mov edx, OFFSET msgBloqueo
	call WriteString
	call Crlf
	exit

main ENDP
END main