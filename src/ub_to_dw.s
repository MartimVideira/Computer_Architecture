.text
.global extendUB_DW
.type extendUB_DW ,"function"

/*
Extend usigned byte integer to double word

X0 :  the length of the array
X1 : the base address
*/


extendUB_DW :
WHILE :		cbz X0 ,FIM
			ldrb w3,[X1],1
			uxtb x3,w3
			str x3,[X2],8
			sub x0,x0,1
			b WHILE
FIM:		ret
