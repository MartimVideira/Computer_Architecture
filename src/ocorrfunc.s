.text
.global ocorr
.type ocorr ,"function"


//w0 � o elemento a pesquisar x1 � o endere�o base w2 � o numero de elementos
ocorr:
			mov w3,0
wocc:		cbz w2 ,Fimocorr
			ldrb w4,[x1],1
			sub	w2,w2,1
			cmp w4,w0
			csinc w3,w3,w3,ne
			b wocc

Fimocorr: 	mov w0,w3
			ret

