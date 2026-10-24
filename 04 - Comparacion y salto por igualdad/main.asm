INCLUDE Irvine32.inc

;Materia: Lenguajes de interfaz
;Alumno: Luis Fernando Velázquez Araujo
;Horario: 9:00/10:00 am
;Docente: Dr. José Luis Medina jiménez
;Practica: 4 Comparacion y salto por igualdad
;Descripción: Compara el numero 2 y el 4 generando un salto por igualdad o mostrar el mensaje msgDiferentes

.data
	msgIguales BYTE "Los valores son iguales", 0
	msgDiferentes BYTE "Los valores son diferentes", 0

.code 
main PROC
	mov eax, 4
	mov ebx, 2
	
	cmp eax, ebx ;SE ENCIENDE ZERO FLAG = 1

	je iguales
	mov edx, OFFSET msgDiferentes
	call WriteString
	
	jmp fin

iguales:
	mov edx, OFFSET msgIguales
	call WriteString 
	jmp fin

fin:
	call Crlf
	exit
main ENDP
END main