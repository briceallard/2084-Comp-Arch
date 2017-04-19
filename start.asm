;Brice Allard
;ASM Assembly Starter File

			.MODEL			SMALL
			.STACK			100H
			.DATA
			
			.CODE
MAIN:		MOV				AX,@DATA
			MOV				DS,AX
			
			;INSERT CODE HERE
			
END:		MOV				AH,4CH
			INT				21H
			END				MAIN