INCLUDE Irvine32.inc

;Materia: Lenguajes de interfaz
;Alumno: Luis Fernando Velázquez Araujo
;Horario: 9:00/10:00 am
;Docente: Dr. José Luis Medina jiménez
;Practica: 7 Validación de formato
;Descripción: Validacion de cadena de 7 caracteres, 3 letras mayusculas seguidas luego 1 guion y 3 digitos


.data
	codigo BYTE 8 DUP(0)
	msgError BYTE "CADENA INVALIDA, INTENTE DE NUEVO", 0
	msgInicial BYTE "Ingrese una cadena de longitud 7, 3 letras mayusculas seguidas de 1 guion y luego 3 numeros", 0
	msgValido BYTE "SU CADENA ES VALIDA", 0
.code 
main PROC
ciclar:								;Etiqueta para volver a pedir una cadena
	mov ESI, 0
	mov edx, OFFSET msgInicial
	call WriteString
	call Crlf
	mov edx, OFFSET codigo
	mov ecx, SIZEOF codigo
	call ReadString

validacion:							;Validacion de la cadena
	mov AL, codigo[ESI]
	cmp ESI, 3
	jl letras
	je guion
	cmp ESI, 6
	jg fin
	jmp digitos

	
letras:								;Valida que el caracter sea una letra
	cmp al, 65
	jl error
	cmp al, 90
	jg error
	INC ESI
	jmp validacion
guion:								;Valida que el caracter sea un guion
	cmp al, 45
	jne error
	INC ESI
	jmp validacion
digitos:							;Valida que sea un digito
	cmp al, 48
	jl error
	cmp al, 57
	jg error
	INC ESI 
	jmp validacion
error:								;Etiqueta para errores
	mov edx, OFFSET msgError
	call WriteString
	call Crlf
	jmp ciclar

fin:
	mov edx, OFFSET msgValido
	call WriteString
	call Crlf
	exit

main ENDP
END main