
.text
.global histo
.type histo ,"function"








/*
Parâmetros:

 x0 :Comprimento da lista das notas do tipo unsigned int é multiplo de 16
x1 :Endereço base de c lista das notas
x2: Endereço base de H o histograma

*/

histo:
		SCVTF S1,W0
		lsr w3,w0,4  // length of the loop para usar instruções simd lsr por 4 equivale a dividir por 2**4
		fsub s2,s2,s2
loop:	cbz W3,Fim
		ldr q0,[x1] //notas do tipo unsigned char ou seja ocupam 1 byte
		mov w5 ,16
loop2:  cbz w5,FIMINC
		ldrsb x7,[x1],1
		ldrb w8,[x2,x7]
		add w8,w8,1
		strb w8 ,[x2,x7]
		sub w5,w5,1
		b loop2



FIMINC:
		addv B3,v0.16B
		umov w6,V3.B[0]
		SCVTF S4,W6
		FDIV S4,S4,S1
		FADD S2,S2,S4
		SUB W3,W3,1
		B loop

Fim:
	fmov s0,s2
	ret






