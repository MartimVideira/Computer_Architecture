.text
.global res1
.type res1 , "function"

//W0 Temos o  w
// D0 TEMOS O X

res1:	FSQRT D0,D0
		SCVTF D1,W0
		FADD D0,D0,D1
		ret
