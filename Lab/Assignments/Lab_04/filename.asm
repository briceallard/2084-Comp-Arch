; Brice Allard
      .MODEL      small
	  .STACK      100h
	  .DATA
Msg   DB          "This is my first Assembly program and I am adding 41+29 and getting $"  ; declares a string of characters
Eoli  DB          13,10,'$'				; declares an end of line string
      .CODE
Main: mov         ax,@data				
      mov         ds,ax					
	  mov         ah,9					; these 3 isntructions write
	  lea         dx,Msg				; the string Msg to the
	  int         21h					; screen
	  
	  mov         cl,41					;palces a value in a register
	  mov         bl,29
	  add         bl,cl					; adds two registers, first one gets result
	  
	  mov         dl,bl					; copy register bl into dl
	  mov         ah,2					;these two instructions
	  int         21h					; write whatever is in DL
	  
	  mov         ah,9					;these 3 instructions print
	  lea         dx,Eoli				;the string Eoli (end of line) to the
	  int         21h					; screen
	  
	  mov         ah,4ch				;these three instructions, always at the end,
	  int         21h					; stop the program execution
	  END         Main
