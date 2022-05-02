//Reverte a ordem de uma string
//Em x0 é passado o endereço base da c string

.text
.global switcharu
.type switcharu ,"function"

//Se quiser trabalhar com o sp e necessitar de por endereços que não são multiplos de m16 passar o valor de sp para um registo

switcharu :

		mov x3,x0
		mov w2,0
		MOV X4,SP
		strb w2,[X4,-1]!
WHILE:
		ldrb w2,[x3],1
		cbz w2,while2
		strb w2,[X4,-1]!
		b WHILE

while2:	ldrb w2,[X4],1
		strb w2,[X0],1
		cbz w2 ,FIM
		b while2

FIM: 	ret
