.text
.global res
.type res, "function"

// D0 M
// D1 N
// D2 B

res:
	FADD D0,D0,D1
	ret
