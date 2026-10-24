INCLUDE Irvine32.inc

;Materia: Lenguajes de interfaz
;Alumno: Luis Fernando Velázquez Araujo
;Horario: 9:00/10:00 am
;Docente: Dr. José Luis Medina jiménez
;Practica: 2 Captura y desplegado de mensajes
;Descripción: Se guardan variables con texto, y una se escribe desde el teclado, para luego desplegarse por consola

.data

mensajeEntrada BYTE "Escribe tu nombre: ", 0
nombre BYTE 10 DUP(0)
caracteresEscritos BYTE "Numero de caracteres: ", 0
experimento BYTE 50 DUP("a") ,"b",0

.code 
main PROC
	mov edx, OFFSET mensajeEntrada	
	call WriteString
	mov edx, OFFSET nombre
	mov ecx, SIZEOF nombre		;Tamaño maximo de caracteres en la cadena

	call ReadString			;Se lee el nombre por consola
	
	mov edx, OFFSET nombre
	call WriteString
	call Crlf

	mov edx, OFFSET caracteresEscritos	;Se despliegan los caracteres escritos
	call WriteString
	call WriteDec
	call Crlf
;	mov edx, OFFSET	experimento
;	call WriteString
;	mov eax, SIZEOF experimento
;	call Crlf
;	call WriteDec

	exit
main ENDP
END main