/*
OP MAT REALIZA OPERA��ES SOBRE UMA MATRIZ

As colunas e as linhas s�o n�meros inteiros sem sinal de 8 bits ou seja unsigned char

L', lin, n - atribui o valor n a todos os elementos da linha lin (0 <= lin < NLIN),

'C', col, n - atribui o valor n a todos os elementos da coluna col (0 <= col < NCOL),

'P', col, lin, n - atribui o valor n ao elemento da coluna col e linha lin,
'B' - "binariza" a matriz, isto �, valores no intervalo [0; 127] s�o substitu�dos por 0 e os restantes s�o
substitu�dos por 255,
'O', n - conta o n�mero de ocorr�ncias do valor n na matriz,

'X' - indica fim das opera��es a realizar pela sub-rotina, estando sempre presente numa sequ�ncia de opera��es.
Pode ocorrer em qualquer posi��o da sequ�ncia (ver exemplo a) em baixo).

A sub-rotina OpMat recebe, por ordem, os seguintes argumentos:
- NCOL, n�mero de colunas da matriz (0 <= NCOL < 256),
- NLIN, n�mero de linhas da matriz (0 <= NLIN < 256),
- OPS, endere�o base do vetor de opera��es a realizar,
- MAT, endere�o base do vetor formado pelos elementos da matriz.
A sub-rotina deve devolver o resultado da �ltima opera��o 'O' realizada, ou -1 se 'O' n�o fizer parte da sequ�ncia de opera��es.

OpMat(numero colunas,nlinhas , endere�obase das operc�es , endere�o base da sequencia)

*/

.text
.global OpMat
.type OpMat, "function"

/*

'L' -> 76
'C' ->67
'P' ->80
'B' ->66
'O' ->79
'X' -> 88

*/


OpMat:		mov w12 ,-1 // o resultado de retorno  da func��o
//Ciclo que percorre as operac�es a realizar sobre a matriz

WhileOP:	ldrb w4,[X2]

			cmp w4, 76 // L
			b.eq Lop

			cmp w4, 67 // C
			b.eq Cop

			cmp w4, 80 // P
			b.eq Pop

			cmp w4, 66 // B
			b.eq Bop

			cmp w4 , 79 // O
			b.eq Oop

			cmp w4, 88 // X
			b.eq Xop

// ==============================OPERATIONS =================================

//OpMat(numero colunas,nlinhas , endere�obase das operc�es , endere�o base da sequencia)
//			0			1			2							3

//L operation --- atribuir o valor n a todos os elementos da mesma linha l
Lop:
				ldrb w5 ,[x2,1]!	//w5 <- linha a alterar
				ldrb w6 , [x2,1]! // w6 <- n
				madd x7,x0,x5,x3  // x7 tem o endere�o aonde a linha a ser alterada comeca  linha = enderecobase + nlinha * n colunas * tamanho elemento
				mov w9, w0
    Whileline:	cbz w9 ,Fimop
    			strb w6,[x7],1
    			sub w9,w9,1
    			b Whileline


//C operation ---- atribuir o valor n a todos os elementos da coluna c
Cop:
				ldrb w5, [x2,1]! //w5 tem a coluna a alterar
				ldrb w6,[x2,1]! //w6 tem o valor do n
				add x7,x3,x5 // endereco do primeiro elemento dessa coluna
				mov w9 ,w1
	Whilecol:	cbz w9 ,Fimop
				strb w6,[x7]
				add x7,x7,x0 // o proximo elemento da coluna � somar o comprimento da coluna a este endere�o
				sub w9,w9,1
				b Whilecol


//P operation ----- atribuir o valor n a um elemento concreto da  matriz
Pop:			ldrb w5,[x2,1]! // col
				ldrb w6 ,[x2,1]! // lin
				ldrb w9 , [x2,1]! // n
				madd x7,x6,x0,x5 // offset col + lin *NCOL
				add x7,x7,x3 // endereco elem = base + offset
				strb w9,[x7]
				b Fimop


//B operation ------ "binariza" a matriz, isto �, valores no intervalo [0; 127] s�o substitu�dos por 0 e os restantes sao substitu�dos por 255
Bop:
				mov w5,w1 // w5 tem o numero de linhas
				mov x9 , x3
				mov w10,0
				mov w11,255
	Whileline1:	cbz w5,Fimop
				sub w5,w5,1
				mov w6,w0
				Whilecol1: 	cbz w6,Whileline1
								sub w6,w6,1
								ldrb w7,[x9],1
								cmp w7,127
								csel w7,w10,w11,le
								strb w7,[x9,-1]
								b Whilecol1


//O operation  n - conta o n�mero de ocorr�ncias do valor n na matriz
/*Na stack vou guardar os valores dos paramentros de OPMAT preciso um total de 1+1 + 8+8 bytes para os parametros
 E preciso ainda mais  16 bytes para frame pointer e para  o link register  ou seja um total de 34 bytes
Para manter o sp num multiplo de 16 irei increment�lo por 48
*/
Oop:
			ldrb w5 ,[x2,1]! //buscar o n de procura
			//Criar a moldura e lidar com os parametros
			stp x29,x30,[SP,-48]!
			mov x29,SP
			strb w0,[SP,16]
			strb w1,[SP,17]
			str x2,[SP,18]
			str x3,[SP,26]

			mul w2,w0,w1 // w2 tem o tamanho do vetor de pesquisa
			mov w0,w5 // w0 tem o valor a pesquisar
			mov x1,x3 // x1 tem o endere�o do vetor
			bl ocorr
			mov w12,w0

			//Recuperar os valores da stack
			ldr x3,[SP,26]
			ldr x2,[SP,18]
			ldrb w1,[SP,17]
			ldrb w0,[SP,16]
			ldp  x29,x30,[SP],48

			b Fimop


//X operation
Xop:
	mov w0,w12
	ret



Fimop:	add x2,x2,1
   		b WhileOP












