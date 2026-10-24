INCLUDE Irvine32.inc

;Materia: Lenguajes de interfaz
;Alumno: Luis Fernando Velázquez Araujo
;Horario: 9:00/10:00 am
;Docente: Dr. José Luis Medina jiménez
;Practica: 14 Registro de existencia en almacen
;Descripción: Hay que recibir por consola un string con un numero no nulo de 2 cifras, validarlo,
;convertirlo a decimal, sumarlo a la existencia, convertir la existencia a string y mostrar por pantalla



.data

bufferDecimal BYTE 4 dup(0)

mensajeInicial BYTE "Bienvenido al sistema de almacen de tarjetas DE DESARROLLO ESP32",0
mensajeLimite BYTE "El maximo de tarjetas que caben en el almacen es de 500", 0
mensajeActual BYTE "La existencia de tarjetas actualmente es de: ", 0
mensajeIngreso BYTE "Ingrese la cantidad (entre 1 y 99) de tarjetas que se recibieron en el almacen", 0
mensajeCorrecto BYTE "A ingresado un valor correctamente dentro de los limites", 0
mensajeError BYTE "La cadena no es valida, asegurese de incluir de 1 a 2 digitos sin signo ni espacios", 0
mensajeOverflow BYTE "Se ha exedido el limite de 500 espacios", 0

cantidadRecibidaString BYTE 4 DUP(0) ; 1 cero es para el final de la cadena y los otros 3 para digitos

cantidadRecibidaNum DWORD ?
existenciaActualNum DWORD 25
acumuladoNum DWORD ?
.code 
main PROC
	mov edx, OFFSET mensajeInicial		;Mensajes iniciales
	call WriteString
	call Crlf
	mov edx, OFFSET mensajeLimite
	call WriteString
	call Crlf
	

repetir:								;Etiqueta para volver a solicitar el ingreso de tarjetas
	mov edx, OFFSET mensajeActual
	call WriteString
;	mov eax, existenciaActualNum
;	call WriteDec
	mov eax, existenciaActualNum
	call convertirDecimal				;Llamada para convertir a String la existencia y desplegarla despues
	mov edx, OFFSET bufferDecimal
	call WriteString
	call Crlf

	mov cantidadRecibidaString, 0		;Reiniciamos la variable para volver a usarla
	mov edx, OFFSET mensajeIngreso
	call WriteString
	call Crlf
	mov edx, OFFSET cantidadRecibidaString
	mov ecx, SIZEOF cantidadRecibidaString
	call ReadString						;Leemos por consola como STRING la cantidad recibida
	call Crlf
	
	cmp eax, 2							;Validacion simple de numero de caracteres (entre 1 y 2)

	jg incorrecto
	cmp eax, 1
	jl incorrecto
	jmp validacionNumerica
incorrecto:								;Etiqueta para errores
	mov edx, OFFSET mensajeError
	call WriteString
	call Crlf
	jmp repetir
validacionNumerica:						;Inicializamos el proceso de validacion numerica
	mov esi, 0
	mov acumuladoNum, 0
ciclar:									
	cmp cantidadRecibidaString[esi], '0'	;Validacion de digito decimal
	jl incorrecto
	cmp cantidadRecibidaString[esi], '9'
	jg incorrecto
	mov eax, acumuladoNum				;Proceso de agregar una nueva cifra al acumulado
	mov ebx, 10
	mul ebx
	mov acumuladoNum, eax
	mov bl, cantidadRecibidaString[esi]
	sub ebx, 30h
	add acumuladoNum, ebx
	inc esi
	cmp cantidadRecibidaString[esi], 0
	je validacionNoNulo
	jmp ciclar

validacionNoNulo:					;Comparacion numerica con el cero para verificar
	cmp acumuladoNum, 0
	je incorrecto
	jmp correcto
overflow:							;Etiqueta para cuando te pasas de los 500 espacios
	mov edx, OFFSET mensajeOverflow
	call WriteString
	call Crlf
	mov ebx, acumuladoNum
	sub existenciaActualNum, ebx
	jmp repetir
correcto:							;Etiqueta para cuando se ha validado numericamente de forma correcta
	mov ebx, acumuladoNum
	add existenciaActualNum, ebx
	cmp existenciaActualNum, 500
	jg overflow

	mov edx, OFFSET mensajeCorrecto	;Mensaje de confirmacion
	call WriteString
	call Crlf
	jmp repetir						;Salto de vuelta a pedir ingreso de tarjetas
	exit
main ENDP



convertirDecimal PROC
	mov esi, 0 
	mov ecx, eax		;Copiamos el num en ECX (C de copia)
	mov ebx, 10

calcular:
	mov edx,0
	div ebx
	add dl, 30h			;Convertir a caracter ascii sumando '0'
	push edx

	inc esi
	cmp eax, 0			
	je iniciarGuardado	;Si eax es 0 ya no quedan digitos y salta al guardado en el buffer
	jmp calcular		;Si eax no es cero regresa a calcular 
iniciarGuardado:
	mov ebx, 0			;Usamos este registro para recorrer las posiciones
	dec esi				;Reducimos el esi en 1 porque guardaba la cantidad de digitos y ahora guarda la ultima posicion del num 
						;por ejemplo: 5 digitos necesitan de la posicion 0 a la 4, esi toma el valor de 4
guardarDigito:
	pop edx						;recuperamos el caracter
	mov bufferDecimal[ebx], dl	
	cmp ebx, esi
	je fin
	inc ebx
	jmp guardarDigito
fin:
	inc ebx
	mov bufferDecimal[ebx], 0
	ret
convertirDecimal ENDP


END main