.text
.global  funcy
.type funcy ,"function"



funcy:
		mov w1 , 2
		scvtf d2,w1
		scvtf d1,w0
		fmul d0,d0,d2
		fadd d0,d0,d1
		ret
