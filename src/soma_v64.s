.text
.global SOMA_V64
.type SOMA_V64, "function"

//SOmar os valores de um array de numeros de 64 bits long ints 8 byte
// X0 recebe o endereço base x1 recebe o comprimentos

SOMA_V64:
	mov x3,0 //Inicializar o contador
WHILE:
	cbz x1,FIM
	ldr x2,[x0],8
	add x3,x3,x2
	sub x1,x1,1
	b WHILE

FIM:
	mov x0,x3
	ret
