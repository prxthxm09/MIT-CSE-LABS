		AREA RESET,DATA,READONLY
		EXPORT __Vectors
__Vectors
		DCD 0x10001000
		DCD Reset_Handler
		ALIGN
		AREA mycode,CODE,READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
		LDR R0,=SRC1
		LDR R1,=SRC2
		LDR R6,=DST
		MOV R2,#4
		MOV R3,#0
UP		LDR R4,[R0],#4
		LDR R5,[R1],#4
		ADDS R7,R4,R3
		ADDS R7,R7,R5
		ADC R3,#0
		STR R7,[R6],#4
		SUBS R2,#1
		BNE UP
STOP	
		B STOP
SRC1 DCD 4,3,2,1
SRC2 DCD 1,2,3,4
		AREA mydata,DATA,READWRITE
DST DCD 0
		END