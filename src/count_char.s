.text
.global COUNT_CHAR
.type COUNT_CHAR,"function"


// Entrada
// x0: endereço base da cadeia de caracteres (endereço de 64 bits)
// w1 : letra a procurar (valor de 8 bits)
// Saida
// W0: numero de ocorrencias

COUNT_CHAR : 	mov X3,X0 // ENDEREÇO PASSA A ESTAR EM X1

				mov W0, 0 // INICIALIZAR CONTADOR DE  OCORRENCIAS
WHILE:			ldrb w2, [x3]
				cmp w2 , 0
				b.eq ACABOU
				cmp w2, w1
				b.ne INCREMENTAR
				add w0,w0,1
INCREMENTAR: 	add x3,x3,1
				b WHILE
ACABOU : 		ret



