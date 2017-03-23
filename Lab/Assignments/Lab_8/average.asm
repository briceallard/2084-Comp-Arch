;Brice Allard
		.MODEL		small
		.STACK		100h
		.DATA
		.CODE
rdr		PROC	near

		mov		ah,1
		int		21h
		sub		al,30h
		mov		ch,10
		mul		ch

		mov		bl,al

		mov		ah,1
		int		21h
		sub		al,30h
		add		bl,al

		RET
rdr		ENDP

prnt	PROC	near

		push	ax
		push	bx
		push	cx
		push	dx

		mov		bp,sp
		mov		ax,[bp+10]

		mov		ah,0
		mov		bl,10
		div		bl

		mov		dl,al
		mov		bl,ah
		add		dl,30H

		mov		ah,2
		int		21H 

		add		bl,30H
		mov		dl,bl

		mov		ah,2
		int		21H 

		mov		[bp+10],ax

		pop 	dx
		pop 	cx
		pop 	bx
		pop 	ax

		RET
prnt	ENDP


Main:	mov		ax,@data
		mov		ds,ax

		mov		dx,0
		mov		cl,0

LUP:	cmp		cl,3
		JE		E

		CALL	rdr ; 99

		mov		bh,bl

		CALL	rdr ; 99

		add		bl, bh
		mov		bh, 0
		add		dx, bx

		mov		bx,0

		; cl++
		add		cl,1
		jmp		LUP

	E:	mov		ax, dx
		mov		dl, 6
		div		dl

		push 	AX
		CALL	prnt
		pop 	AX

		mov		ah,4ch
		int		21h
		END		Main
