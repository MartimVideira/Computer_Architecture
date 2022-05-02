.text
.global SUM_ARRAY
.type SUM_ARRAY, "function"

/* Returns the sum of all integers in an integer  array

X0 is the base address of the sequence
X1 is the lenght of the array

the result is returned through X0
*/

SUM_ARRAY:	mov X2,X0
			mov X0, 0
WHILE:		cmp X1,0
			b.eq FIM
			ldr X3,[X2]
			add X0,X0,X3
			add X2,X2,4
			sub X1,X1,1
			b WHILE
FIM:		ret
