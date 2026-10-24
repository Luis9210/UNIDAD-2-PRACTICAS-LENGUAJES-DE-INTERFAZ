INCLUDE Irvine32.inc

.data

mensaje BYTE "Hola, mundo!", 0

.code 
main PROC
	mov ecx, 5                ;Contador decreciente
	mov edx, OFFSET mensaje   ;Byte inicial del mensaje
ciclo:
	call WriteString      ;Usa el OFFSET para imprimir el mensaje desde el byte inicial hasta ver un 0
	call Crlf             ;Realiza el salto de línea
	loop ciclo            ;Función de irvine32 para ciclar
	exit 

main ENDP
END main