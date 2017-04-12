;Brice Allard
			.MODEL			small
			.STACK			100h
			.DATA
			
			.CODE		
Main:		MOV				AX,@DATA
			MOV				DS,AX
			
			
			
LUP:		MOV				AH,1		
			INT				21h				;reads input
			
			CMP				AL,0Dh
			JE				E				;Ends if input = 'Enter'

			MOV				BL,AL
			
			MOV				AH,1
			INT				21H
			
			SHL				BL,4
			SHR				BL,6
			SHL				BL,3
			
			SHL				AL,4
			SHR				AL,5
			
			OR				BL,40h
			OR				AL,BL
			
			MOV				DL,AL
			MOV				AH,2
			INT				21h
			
;			MOV				DL,BL
;			MOV				AH,2
;			INT				21h
			
			JMP				LUP
			
E:			MOV				AH,4Ch
			INT				21h
			END				Main
