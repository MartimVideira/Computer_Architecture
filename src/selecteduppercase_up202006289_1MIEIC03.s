.text
.global SelectedUpperCase
.type SelectedUpperCase,"function"


/*
Recebe seq_a e seq_b os elementos de seq_B são todos distintos e apenas podem ser letras minúsculas,
sem acentos ou outras alterações. A sub-rotina altera para a sua versão maiúscula,
todos os carateres de seq_A que surgem na seq_B. Apenas carateres que sejam letras minúsculas,
sem acentos ou outras alterações, deverão ser alterados. Para além de alterar a seq_A,
a sub-rotina deve retornar o número de carateres de seq_A que são alterados (este valor é um inteiro sem sinal).

em x0 : o endereço base de seq_B
em x1 : o endereço base de seq_A
*/

SelectedUpperCase:	mov  w5,0 //Inicializar contador
WHILE_out:			ldrb w2,[x0],1 	//w2 fica com a letra de seq_b para passar as de seq_a para maiuscula
					cbz w2 ,FIM_out //quando w2  = \0 ou em decimal 0  representa o fim da string
					mov x3,x1	//como vamos percorrer len(seq_b) vezes a seq_a preciso de guardar o endereçob da seq_a
WHILE_in:			ldrb w4,[x3],1	//w4 fica com a letra de seq_a
					cbz w4, FIM_in
					cmp w2,w4	//ver se a letra de seq_a é a letra de seq_b
					b.ne WHILE_in
					sub w4,w4,32 // passar essa letra a maiuscula
					strb w4,[x3,-1] // como usei pos-incremento tenho que deslocar um byte para tras para obter o outro endereco
					add w5,w5,1	//incrementar o contador
					b WHILE_in

FIM_in:				b WHILE_out

FIM_out:			mov x0,x5 // mover para dar retorno
					ret
