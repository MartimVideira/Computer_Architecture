.data
const3: .float 3.0

.text
.global func
.type func , "function"

/*
S0 A ,   S1 B , S2 C ,S3 D

Resultado em S0

	  (A-B)×C
	---------
	  D+A-3

Como a constante foi declarada neste ficheiro  posso fazer logo
ldr s5,const3
*/


func:
		ldr   X0,=const3
		ldr s5,[x0]
		fadd s4,s3,s0
		fsub s4,s4,s5

		fsub s0 , s0, s1
		fmul s0,s0,s2
		fdiv s0,s0,s4
		ret
