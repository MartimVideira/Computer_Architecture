.text
.global SelectedUpperCase
.type SelectedUpperCase,"function"


/*
Recebe seq_a e seq_b os elementos de seq_B s�o todos distintos e apenas podem ser letras min�sculas,
sem acentos ou outras altera��es. A sub-rotina altera para a sua vers�o mai�scula,
todos os carateres de seq_A que surgem na seq_B. Apenas carateres que sejam letras min�sculas,
sem acentos ou outras altera��es, dever�o ser alterados. Para al�m de alterar a seq_A,
a sub-rotina deve retornar o n�mero de carateres de seq_A que s�o alterados (este valor � um inteiro sem sinal).

em x0 : o endere�o base de seq_B
em x1 : o endere�o base de seq_A
*/

SelectedUpperCase:	mov  w5,0 //Inicializar contador
WHILE_out:			ldrb w2,[x0],1 	//w2 fica com a letra de seq_b para passar as de seq_a para maiuscula
					cbz w2 ,FIM_out //quando w2  = \0 ou em decimal 0  representa o fim da string
					mov x3,x1	//como vamos percorrer len(seq_b) vezes a seq_a preciso de guardar o endere�ob da seq_a
WHILE_in:			ldrb w4,[x3],1	//w4 fica com a letra de seq_a
					cbz w4, FIM_in
					cmp w2,w4	//ver se a letra de seq_a � a letra de seq_b
					b.ne WHILE_in
					sub w4,w4,32 // passar essa letra a maiuscula
					strb w4,[x3,-1] // como usei pos-incremento tenho que deslocar um byte para tras para obter o outro endereco
					add w5,w5,1	//incrementar o contador
					b WHILE_in

FIM_in:				b WHILE_out

FIM_out:			mov x0,x5 // mover para dar retorno
					ret
