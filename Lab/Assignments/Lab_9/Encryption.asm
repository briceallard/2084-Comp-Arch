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

			SHL				AL,3
			SHR				AL,3
			MOV				BL,AL
			SHR				AL,3
			SHL				AL,2
			SHL				BL,5
			SHR				BL,4
			
			OR				AL,41h
			OR				BL,41h
			
			MOV				DL,AL
			MOV				AH,2
			INT				21h
			
			MOV				DL,BL
			MOV				AH,2
			INT				21h
			
			JMP				LUP
			
E:			MOV				AH,4Ch
			INT				21h
			END				Main
