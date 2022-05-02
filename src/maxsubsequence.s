.text
.global  Maxsumsubseq
.type Maxsumsubseq , "function"


//X0 o endereço base do vetor de unsigned ints ou seja cada elemento tem 32 bits
//w1 o tamanho da sequencia



Maxsumsubseq:
	// o minimo da soma de unsigned ints é 0
	mov w2, 0  //Media maior
	mov w3,0 //Media temporaria
	mov w4,0 //valor anterior

Loop: cbz w1, Fim
		ldr w5,[x0],4
		cmp w5,w4
		b.lo not_in_sequence
		add w3,w3,w5
		b next
not_in_sequence:
		cmp w3,w2
		csel w2,w3,w2,hi
		mov w3,w5

next:
		mov w4,w5
		sub w1,w1,1
		b Loop



Fim:
	mov w0,w2
	ret
