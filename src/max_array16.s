.text
.global max_array
.type max_array , "function"


//Retorna -1 caso a sequencia esteja vazia
//Senão retorna  o valor máximo de um aray de short int
//X0 recebe o endereço base da sequencia
//X1 recebe o comprimento da sequencia

max_array:
	mov w2 ,-1
	cbz x1 ,FIM
	ldrsh w2,[x0],2 //Assumir que o primeiro elemento da seq é o maior
	sub x1,x1,1
WHILE:
	cbz x1 ,FIM
	ldrsh w3,[x0],2
	cmp w3,w2
	csel w2,w3,w2,ge
	sub x1,x1,1
	b WHILE

FIM:
	mov w0,w2
	ret
