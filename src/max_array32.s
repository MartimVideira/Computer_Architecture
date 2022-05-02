.text
.global max_array
.type max_array ,"function"

//Caso a sequencia seja uma sequencia vazia retorna -1
//Retorna o int maior de uma sequencia
// X0 é o endereço base e X1 é o comprimento da sequencia


max_array:
		mov w2,-1
		cbz X1,FIM
		ldr w2,[x0],4 // w2 contém o maior
		sub x1,x1,1
WHILE:
		cbz X1,FIM
		ldr w3,[x0],4
		cmp w3,w2
		csel w2,w3,w2,gt
		sub x1,x1,1
		b WHILE
FIM:
		mov W0,W2
		ret
