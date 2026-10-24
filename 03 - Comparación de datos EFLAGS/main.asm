INCLUDE Irvine32.inc

;Materia: Lenguajes de interfaz
;Alumno: Luis Fernando Velázquez Araujo
;Horario: 9:00/10:00 am
;Docente: Dr. José Luis Medina jiménez
;Practica: 3 Comparacion y prueba
;Descripción: Uso de CMP y de TEST, demostrando como afectan a las FLAGS

.code 
main PROC
	;CASO 1
	mov eax, 10h

	cmp eax, 10h
	call DumpRegs
	;CASO 2
	mov eax, 0
	mov ebx, 0

	mov al, -5
	mov bl, 1
	cmp al, bl
	call DumpRegs

	;Caso 3 Carry flag
	mov eax, 0
	mov ebx, 0

	mov al, 5
	mov bl, 10

	cmp al, bl
	call DumpRegs
	
	;Caso 4 OVERFLOW
	mov eax, 0
	mov ebx, 0

	mov al, -128
	mov bl, 1

	cmp al, bl
	call DumpRegs

	;Caso 5 TEST

	mov eax, 5
	test eax, 1
	call DumpRegs

	;00000101;
	;00000001;
	;--------;
	;00000001;



	exit
main ENDP
END main