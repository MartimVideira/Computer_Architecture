.text
.global closestCircle
.type closestCircle , "function"

/*

Legenda:
NP -> numero de pontos

VP -> vetor de pontos de precis�o simples (x,y)
len vp = 2* Np

NC -> numero de circunferencias

VC -> vetor ras representa�oes das circunferencias (xc,yc, r)
len  vc = 3 * Nc

ID -> vetor que vai ser preenchido com o indice (0,Nc-1 ) da circunferencia mais proxima a cada ponto .
o tamanho de id � Np



N�o tem retorno

Regras:
d = sqrt( ( x - xc)**2 + (y-yc)**2) -r

->Se  d > 0  o ponto n�o pertence ao circulo
S� neste caso � que se trata de uma distancia valida e vamos ver se � a distancia valida minima

-> Se d <= 0 o ponto pertence ao circulo e n�o se considera como valida essa   ou seja esse circulo n�o poder� ser o
circulo mais pr�ximo

->Caso o  ponto perten�a a todos os circulos a posi��o de Id referente a esse ponto deve manter o valor -1 pre prenchido na inicializa��o
em main.

->No caso de haver v�rias circunfer�ncias � mesma dist�ncia de um ponto e se essa dist�ncia for a m�nima, considerar o �ndice da �ltima circunfer�ncia
encontrada nessa situa��o.

*/


/*
Parametros:
WO : unsigned int valor de NP

X1 : endere�o base de VP

w2 : valor de NC unsigned int

x3 : endere�o base de VC

x4 : endere�o base de  ID
*/

CalculateD://D estar� em d5
		fsub d5,d0,d2
		fmul d5,d5,d5

		fsub d6,d1,d3
		fmul d6,d6,d6

		fadd d5,d5,d6
		fsqrt d5,d5

		fsub d5,d5,d4
		b GotD





closestCircle:

//Percorrer cada ponto na lista vp	pontos precis�o simples
//S� preciso de percorrer np vezes pois em cada vez leio 2 valores da lista as duas cordenadas do ponto
MAIN_CICLE:
		cbz  w0,FIM_MAINCICLE
		ldr  s0,[x1],4
		ldr  s1 ,[x1],4
		fcvt d0,s0 // converter para precis�o dupla para realizar as operacoes
		fcvt d1,s1
		mov w5,w2  //Conservar o valor de nc para as varias iteracoes de maincicle
		mov x6,x3//Conservar o endereco de vc  cada elemento tem 8 bytes
		mov w7,-1 // Indice da circunferencia mais pr�xima ou seja ainda n�o existe

//S� preciso de percorrer nc vezes pois em cada vez retiro os 3 valores que caracterizam a circunferencia
//E tenho em aten��o que os registos s e d s�o partilhados
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
		fmov d7,d5 //Guardar a distancia minima para futuras compara�oes
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







































