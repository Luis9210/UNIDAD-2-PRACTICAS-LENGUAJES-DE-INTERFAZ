INCLUDE Irvine32.inc

;Materia: Lenguajes de interfaz
;Alumno: Luis Fernando Velázquez Araujo
;Horario: 9:00/10:00 am
;Docente: Dr. José Luis Medina jiménez
;Practica: 4 Salto incondicional
;Descripción: Uso de salto incondicional JMP 

.code 
main PROC
	mov eax, 5
	jmp continuar
	mov eax, 10				;Esta linea no se ejecuta
	

continuar:
	call DumpRegs
	exit

main ENDP
END main