.text
.global SOMA_V
.type SOMA_V, "function"


// Retorna em x0 a soma dos valores de uma array de inteiros
//X0 tem o  endereço base x1 tem o numero de elementos da sequencia


SOMA_V:
	mov x3,0
WHILE:
	cbz X1,FIM
	ldr w2,[X0],4
	add x3,x3,w2,sxtw
	sub x1,x1,1
	b WHILE

FIM:
	mov x0,x3
	ret
