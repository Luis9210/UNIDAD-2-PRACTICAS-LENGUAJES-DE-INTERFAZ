INCLUDE Irvine32.inc

;Materia: Lenguajes de interfaz
;Alumno: Luis Fernando Velázquez Araujo
;Horario: 9:00/10:00 am
;Docente: Dr. José Luis Medina jiménez
;Practica: 12 - Desplazamiento y rotación
;Descripción: Pruebas simples de SHL SHR SAR ROR ROL RCR RCL
.data 
mensajeRolls BYTE "------------------   SECCION DE ROR, ROL, RCR, RCL    ---------------------------------------- ", 0
.code 
main PROC
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

; 1 - SHL: DESPLAZAR UN BIT HACIA LA IZQUIERDA
	mov al, 10000110b
	shl al, 1

	call DumpRegs
	call WriteBin
	call Crlf

;2 - SHR: DESPLAZAR UN BIT HACIA LA DERECHA
	mov al, 00001101b
	shr al, 1

	call DumpRegs
	call WriteBin
	call Crlf

	
;3 - SAR: DESPLAZAMIENTO CON SIGNO
	mov eax, 0
	mov al, -8
	sar al, 1

	call DumpRegs
	call WriteBin
	call Crlf
;4 - SAR: DESPLAZAMIENTO CON VALOR IMPAR
	mov eax, 0
	mov al, -9
	sar al, 1
	
	call DumpRegs
	call WriteBin
	call Crlf
;5 - C0NTEO CONSTANTE: DESPLAZAR DOS POSICIONES
	mov al, 00001100b
	shl al, 2

	call DumpRegs
	call WriteBin
	call Crlf
;6 - CONTEO CON CL: DESPLAZAR UTILIZANDO REGISTRO
	mov al, 00001100b
	mov cl, 2
	shr al, cl
	call DumpRegs
	call WriteBin
	call Crlf

;7 - ROR, ROL, RCR, RCL
	mov edx, offset mensajeRolls
	call WriteString
	call Crlf
	clc
	mov eax, 0
	mov al, 10000001b
	ROR al, 1
	
	call DumpRegs
	call WriteBin
	call Crlf

	rol al, 1

	call DumpRegs
	call WriteBin
	call Crlf

	rcr al, 1

	rcl al, 1
	call DumpRegs
	call WriteBin
	call Crlf


	exit
main ENDP
END main