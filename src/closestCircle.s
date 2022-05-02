.text
.global closestCircle
.type closestCircle , "function"

/*

Legenda:
NP -> numero de pontos

VP -> vetor de pontos de precisão simples (x,y)
len vp = 2* Np

NC -> numero de circunferencias

VC -> vetor ras representaçoes das circunferencias (xc,yc, r)
len  vc = 3 * Nc

ID -> vetor que vai ser preenchido com o indice (0,Nc-1 ) da circunferencia mais proxima a cada ponto .
o tamanho de id é Np



Não tem retorno

Regras:
d = sqrt( ( x - xc)**2 + (y-yc)**2) -r

->Se  d > 0  o ponto não pertence ao circulo
Só neste caso é que se trata de uma distancia valida e vamos ver se é a distancia valida minima

-> Se d <= 0 o ponto pertence ao circulo e não se considera como valida essa   ou seja esse circulo não poderá ser o
circulo mais próximo

->Caso o  ponto pertença a todos os circulos a posição de Id referente a esse ponto deve manter o valor -1 pre prenchido na inicialização
em main.

->No caso de haver várias circunferências à mesma distância de um ponto e se essa distância for a mínima, considerar o índice da última circunferência
encontrada nessa situação.

*/


/*
Parametros:
WO : unsigned int valor de NP

X1 : endereço base de VP

w2 : valor de NC unsigned int

x3 : endereço base de VC

x4 : endereço base de  ID
*/

CalculateD://D estará em d5
		fsub d5,d0,d2
		fmul d5,d5,d5

		fsub d6,d1,d3
		fmul d6,d6,d6

		fadd d5,d5,d6
		fsqrt d5,d5

		fsub d5,d5,d4
		b GotD





closestCircle:

//Percorrer cada ponto na lista vp	pontos precisão simples
//Só preciso de percorrer np vezes pois em cada vez leio 2 valores da lista as duas cordenadas do ponto
MAIN_CICLE:
		cbz  w0,FIM_MAINCICLE
		ldr  s0,[x1],4
		ldr  s1 ,[x1],4
		fcvt d0,s0 // converter para precisão dupla para realizar as operacoes
		fcvt d1,s1
		mov w5,w2  //Conservar o valor de nc para as varias iteracoes de maincicle
		mov x6,x3//Conservar o endereco de vc  cada elemento tem 8 bytes
		mov w7,-1 // Indice da circunferencia mais próxima ou seja ainda não existe

//Só preciso de percorrer nc vezes pois em cada vez retiro os 3 valores que caracterizam a circunferencia
//E tenho em atenção que os registos s e d são partilhados
//Entramos Agora no ciclo que percorre todas as circunferencias

CIRCLE_CICLE:
		cbz	w5, FIM_CIRCLECICLE
		ldr d2,[x6],8 // xc
		ldr d3 ,[x6],8 //yc
		ldr d4,[x6] , 8 // r
		b CalculateD
GotD:	fcmp d5,#0.0
		b.le prox
		cmp w7,-1
		b.ne jahaminimo
		sub w9,w2,w5
		mov w7,w9 //Guardar o indice da circunferencia para depois meter em id
		fmov d7,d5 //Guardar a distancia minima para futuras comparaçoes
		b prox

jahaminimo:
		fcmp d5,d7
		b.gt prox
		sub w9,w2,w5
		mov w7,w9
		fmov d7,d5

prox:	sub w5,w5,1
		b CIRCLE_CICLE

//Voltamos ao MAIN_CICLE
FIM_CIRCLECICLE:

		str w7,[x4],4
		sub w0,w0,1
		b MAIN_CICLE




FIM_MAINCICLE:
		ret







































