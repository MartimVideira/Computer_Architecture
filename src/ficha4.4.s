//=====================Exercicio  4 da ficha4 ====================================

.text
.global POLI
.type POLI ,"function"


POLI:
	//Como vamos chamar uma subrotina temos que lidar com a pilha com pelo menos 16 bytes mas temos que acrescentar
	// mais oito devido a que no nosso programa mexe no x20 q por convenção ou seja temos que o guardar na stack
	stp X29,X30,[SP ,-32]!
	str	X20 ,[SP,16]
	mov X29 ,SP

	mov X10 , X0  // x10 <- a
	b QUAD		//x0 <--a  ** 2
l1:	mov X20 ,X0  //x20 <- a ** 2
	mov X0,3	// x0 <- 3
	mul X10,X10,X0 	// x10  <- 3 * a
	add X0, X20 ,X10 // x0 <- a**2 + 3 * a
	add x0, x0 ,1 	// x0 ou seja o valor de retorno será a**2 + 3*a + 1

	// Retomar os valores da pilha
	ldr X20 ,[SP,16]
	ldp x29 ,X30,[SP],32


	ret



QUAD:   mul X0 ,X0 ,X0
		b l1



//No ecrâ apareceria : 71 para x0 = 7;
