.text
.global sort , swap
.type sort, "function"
.type swap, "function"

/*Recebe um array of integers e organiza-o por ordem ascendente
X0 : endereço base do array
x1 : o numero de elementos da sequencia

Para isso vou fazer uma função swap que troca dois items numa sequencia
recebe em X0 o endereço de um item e em X1 o endereço do outro item
usa o registo X8 e x9 para guardar um inteiro
*/

swap :
		ldr w8,[X0]
		ldr w9,[X1]
		str w8, [X1]
		str w9, [X0]
		ret



sort:
WHILE:		cmp X1,1
			b.eq FIM
			ldr w2,[X0]
			mov X3,X0 //Endereço do integer atual para poder usar no segundo ciclo
			add X3,X3,4
			mov x4,x1
INWHILE	 :  cmp X4,1
			b.eq BACK_OUT
			ldr	W5,[x3]
			cmp W2,W5
			b.le INCRINNER
			mov X6,X1
			mov w2,w5
			mov x1,x3
			bl	swap
BACK_SWAP:	mov X1,X6
INCRINNER:  add x3,x3,4
			sub X4,X4,1
			b INWHILE
BACK_OUT:	add X0,X0,4 //Next integer
			sub X1,X1,1 //Decrementar o numero de elementos para voltar ao inicio do ciclo
			b WHILE
FIM:		ret


