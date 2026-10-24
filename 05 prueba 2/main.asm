INCLUDE Irvine32.inc

;Materia: Lenguajes de interfaz
;Alumno: Luis Fernando Velázquez Araujo
;Horario: 9:00/10:00 am
;Docente: Dr. José Luis Medina jiménez
;Practica: 5.1 Repetir hasta que el usuario ingrese cero 
;Descripción: Perdí esta practica por un problema con mi visual que hubo con una actualizacion ese dia


.data
mensaje BYTE "Hola, mundo!",0

.code 
main PROC
	mov edx, OFFSET mensaje
	call WriteString
	call Crlf

	exit
main ENDP
END main