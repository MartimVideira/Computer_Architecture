.text
.global min_array
.type min_array, "function"


//Retorna -1 caso a sequencia esteja vazia
//X0 tem o endereço base e x1 tem o comprimento

min_array:
	mov x2,-1
	cbz x1 ,FIM //Se a sequencia é vazia retornar -1
	ldr x2, [x0],8 //Partir do principio que o primeiro elemento é o mais pequeno
	sub x1,x1,1

WHILE:
	cbz x1,FIM
	ldr x3,[x0],8
	cmp x3,x2
	csel x2,x3,x2,lt
	sub x1,x1,1
	b WHILE


FIM:
	mov x0,x2
	ret
