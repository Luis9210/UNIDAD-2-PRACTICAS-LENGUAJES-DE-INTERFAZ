INCLUDE Irvine32.inc
;Materia: Lenguajes de interfaz
;Alumno: Luis Fernando Velázquez Araujo
;Horario: 9:00/10:00 am
;Docente: Dr. José Luis Medina jiménez
;Practica: 13 Conversion de hexadecimal a String
;Descripción: Tomamos un numero HEX guardado en EAX lo convertimos a string y se muestra por pantalla

.data
bufferHex BYTE 9 DUP(0)


.code 
main PROC
	mov eax, 12AB34CDh
	call convertirString

	exit
main ENDP


convertirString PROC			
	push eax			
	mov ecx, eax		
	mov esi, 0
	mov ebx, 0
ciclar:							;Calcula los valores ascii y los mete a la pila
	mov eax, ecx				;Copiamos el numero en ECX para operar en EAX sin perder el valor
	call desplazar				
	and al, 0fh
	call obtenerCaracter
	push eax
	inc esi
	cmp esi, 7
	jg guardar
	jmp ciclar
guardar:					;saca los valores de la pila y los mete al buffer en orden
	MOV edx, 8
	sub edx, esi
	pop ebx
	mov bufferHex[edx], bl
	dec esi
	cmp esi, 0
	je fin
	jmp guardar
fin:
	mov edx, OFFSET bufferHex
	call WriteString
	call Crlf
	pop eax
	ret
convertirString ENDP



desplazar PROC			;Opera en EAX para tener a mano el digito hexadecimal a guardar
	push esi
	INC esi				;Ajustamos el ESI para estar en el byte correcto al desplazar
ciclar:
	cmp esi, 1
	je fin
	shr eax, 4
	dec esi
	jmp ciclar
fin:
	pop esi
	ret
desplazar ENDP



obtenerCaracter PROC	;Evalua si el caracter está entre 0 y 9 ó entre A y F
	cmp al, 9			;además hace la conversion ascii
	jg hexadecimal
	add eax, 30h
	jmp fin
hexadecimal:
	add eax, 55			;Restar 10 y sumar 'A' (65-10=55)
	jmp fin
fin:
	ret
obtenerCaracter ENDP


END main