.text
.global extendSW_DW
.type extendSW_DW,"function"

/*Extende uma sequencia de inteiros signed word para double word noutra sequencia

x0 : len
x1 : addr sequencia de sw
x2 : addr sequencia de dw

*/

extendSW_DW :
WHILE :		cbz X0,FIM
			ldr W3, [X1],4
			sxtw X3,W3
			str X3 ,[X2],8
			sub X0,X0,1
			b WHILE
FIM: 		ret
