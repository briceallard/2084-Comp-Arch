;Brice Allard

			    .MODEL   	  small
			    .STACK    	100h
			    .DATA     

New  		  DB			    " New England is the Winner!",13,10,'$'
Atl			  DB			    " Atlanta is the Winner!",13,10,'$'
Tie			  DB			    " It is a TIE!",13,10,'$'
			    .CODE
			
rdr			  PROC		    near
			
          mov  		    AH,1
          int		 	    21H
          sub			    AL,30h
          mov			    CL,AL

          mov		  	  AH,1
          int			    21H
          sub		   	  AL,30h
          mov		  	  BL,AL

          mov			    al,10
          MUL			    CL
          mov			    cl,al

          ADD			    CL,BL
			
          RET
rdr			  ENDP
Main:
          mov			    ax,@data
          mov			    ds,ax

          mov			    ch,0
LUP:		  CMP			    ch,3
          JE			    DONE

          CALL		    rdr

          mov			    bh,cl

          CALL		    rdr

          CMP			    bh,cl
			
      		JG			    N
      		JL			    A
      		JMP		  	  T

A:			  mov			    ah,9
      		lea			    dx,Atl
          int			    21h
      		JMP			    E

N:	 		  mov			    ah,9
      		lea			    dx,New
      		int			    21h
      		JMP			    E

T:	  		mov			    ah,9
      		lea			    dx,Tie
      		int			    21h

E:  		  ADD			    ch,1
      		JMP			    LUP

DONE:
      		mov		  	  ah,4ch
      		int		  	  21h
			    END			    Main
