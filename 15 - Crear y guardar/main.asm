INCLUDE Irvine32.inc
;Materia: Lenguajes de interfaz
;Alumno: Luis Fernando Velázquez Araujo
;Horario: 9:00/10:00 am
;Docente: Dr. José Luis Medina jiménez
;Practica: 15 - Crear y guardar
;Descripción: Creamos un archivo .txt le escribimos un "125", lo guardamos y lo cerramos
.data
	nombreArchivo BYTE "Inventario.txt", 0
	texto BYTE "125", 0
	archivoHandle DWORD ?

	mensajeExito BYTE "Archivo guardado.", 0
	mensajeError BYTE "No se pudo guardar el archivo", 0


.code 
main PROC
;1. Crear el archivo txt
	mov edx, OFFSET nombreArchivo
	call CreateOutputFile
	cmp eax, INVALID_HANDLE_VALUE
	call DumpRegs
	je error

	mov archivoHandle, eax
;2 Escribier los caracteres. ("125")
	mov eax, archivoHandle
	mov edx, OFFSET texto
	mov ecx, SIZEOF texto - 1
	call WriteToFile

	jc errorEscritura

	cmp eax, SIZEOF texto -1
	jne error
;3. Guardar el archivo/Cerrar archivo
	mov eax, archivoHandle
	call CloseFile

	test eax, eax
	jz error 
	
	mov edx, OFFSET mensajeExito 
	call WriteString
	call Crlf
	jmp fin

; Etiquetas 
errorEscritura: 
	mov eax, archivoHandle
	call CloseFile

error:
	mov edx, OFFSET mensajeError
	call WriteString
fin:
	exit
main ENDP
END main