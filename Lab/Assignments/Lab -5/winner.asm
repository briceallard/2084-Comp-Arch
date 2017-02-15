;Brice Allard
        .MODEL   	small
		.STACK    	100h
		.DATA     

New  	DB			"New England is the Winner!",13,10,'$'
Atl		DB			"Atlanta is the Winner!",13,10,'$'
Tie		DB			"It is a TIE!",13,10,'$'
		.CODE
Main:
		mov			ax,@data
		mov			ds,ax
		
		mov		  	AH,1
		int		 	21H
		sub			AL,30h
		mov			CL,AL
		
		mov			AH,1
		int			21H
		sub			AL,30h
		mov			BL,AL
		
		CMP			CL,BL
		JG			N
		JL			A
		JMP			T
	
N:		mov			ah,9
		lea			dx,New
		int			21h
		JMP			E
		
A:		mov			ah,9
		lea			dx,Atl
		int			21h
		JMP			E
		
T:		mov			ah,9
		lea			dx,Tie
		int			21h
				
E:		mov			ah,4ch
		int			21h
		END			Main