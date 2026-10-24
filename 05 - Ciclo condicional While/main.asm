INCLUDE Irvine32.inc

;Materia: Lenguajes de interfaz
;Alumno: Luis Fernando Velázquez Araujo
;Horario: 9:00/10:00 am
;Docente: Dr. José Luis Medina jiménez
;Practica: 5 - Condicionales
;Descripción: La verdad no recuerdo como era originalmente esta practica pero hice uso de las mismas funciones
;Este codigo cuenta de 1 en 1 hasta el 999999999 y luego suma 1 en el segundo ciclo hasta llegar a 999999999 en el segundo
.code 
main PROC

	mov ebx, 1
    

ciclo:

	cmp eax, 999999999

	jg ciclo2
;	call WriteDec
;	call Crlf

	inc eax

	jmp ciclo
	
ciclo2:
	mov eax, ebx
	call WriteDec
	call Crlf
	mov eax, 1
	cmp ebx, 999999999
	jg fin
	inc ebx
	jmp ciclo

fin:

	exit

main ENDP
END main