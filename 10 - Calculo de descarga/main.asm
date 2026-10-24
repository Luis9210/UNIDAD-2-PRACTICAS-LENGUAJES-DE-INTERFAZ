INCLUDE Irvine32.inc

;Materia: Lenguajes de interfaz
;Alumno: Luis Fernando Velázquez Araujo
;Horario: 9:00/10:00 am
;Docente: Dr. José Luis Medina jiménez
;Practica: 10 Calculo de descarga
;Descripción: Hay que mostrar por pantalla datos pre calculados como datos numericos para ser convertidos a string



.data
bufferDecimal BYTE 12 dup(0)

mensajeInicial BYTE "Se esta descargando un archivo de 100,000 BYTES", 0
descargadosMensaje BYTE "Bytes que se han descargado: ", 0
pendientesMensaje BYTE "Bytes pendientes: ", 0
porcentajeMensaje BYTE "Porcentaje entero de avance: ", 0
simboloMensaje BYTE "%", 0
gruposMensaje BYTE "Grupos completos de 1024 Bytes: ", 0
residuoMensaje BYTE "Residuo del agrupamiento: ", 0

descargadosNum DWORD ?
pendientesNum DWORD ?
tamanhoTotal = 100000
porcentajeAvanceNum DWORD ?
gruposCompletosNum DWORD ?
residuoNum DWORD ?

.code 
main PROC
	mov eax, 125				;Calculamos los bytes descargados
	mov ebx, 512
	mul ebx
	mov descargadosNum, eax		;guardamos en la variable
	
	mov eax, tamanhoTotal		;Calculamos los bytes pendientes
	mov ebx, descargadosNum
	sub eax, ebx
	mov pendientesNum, eax		;guardamos en la variable

	mov eax, descargadosNum		;Calculamos el porcentaje de avance
	mov ebx, 100
	mul ebx
	mov ebx, tamanhoTotal
	div ebx
	mov	porcentajeAvanceNum, eax	;guardarmos en la variable

	mov eax, descargadosNum			
	mov ebx, 1024
	div ebx
	mov gruposCompletosNum, eax		;guardamos los grupos completos
	mov residuoNum, edx				;guardamos el residuo

	mov edx, OFFSET mensajeInicial
	call WriteString
	call Crlf

	mov eax, descargadosNum		;Imprimimos los descargados
	call convertirDecimal
	mov edx, OFFSET descargadosMensaje	
	call WriteString
	mov edx, OFFSET bufferDecimal
	call WriteString
	call Crlf

	mov eax, pendientesNum		;Imprimimos los pendientes
	call convertirDecimal
	mov edx, OFFSET pendientesMensaje
	call WriteString
	mov edx, OFFSET bufferDecimal
	call WriteString
	call Crlf

	mov eax, porcentajeAvanceNum	;Imprimimos el porcentaje de avance
	call convertirDecimal
	mov edx, OFFSET porcentajeMensaje
	call WriteString
	mov edx, OFFSET bufferDecimal
	call WriteString
	mov edx, OFFSET simboloMensaje
	call WriteString
	call Crlf
	
	mov eax, gruposCompletosNum		;Imprimimos los grupos completos de 1024
	call ConvertirDecimal
	mov edx, OFFSET gruposMensaje
	call WriteString
	mov edx, OFFSET bufferDecimal
	call WriteString
	call Crlf

	mov eax, residuoNum				;Imprimimos el residuo del agrupamiento
	call ConvertirDecimal
	mov edx, OFFSET residuoMensaje
	call WriteString
	mov edx, OFFSET bufferDecimal
	call WriteString
	call Crlf



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