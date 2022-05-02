.text
.global apply_func
.type apply_func ,"function"

/*
x0 : endereço base do vetor
w1 : numero de elementos da sequencia


Vou tratar da stack no final do problema  porque assim já saberei que registos irei usar (qunatos )
ou seja qual será o decremento do stack pointer

como a callee must preserve os registos x19 a x28 eu como sendo uma func callee de main ir guardar aqueles que irei usar
pois se usar os registos x19 a x28 tenho a certeza que naão serao alterados pelas funcs que eu irei chamar

*/


apply_func:

	//Vou construir o meu frame
	stp x29,x30,[sp,-48]!
	mov x29 ,sp

	stp x19 ,x20,[x29,16]
	str w21 ,[x29,32]
	mov  x19,x0
	mov w20 ,w1
	mov w21 , 0

loop:	cbz w20 ,fim
		ldr d0 , [x19]
		mov w3,3
		scvtf d3,w3
		fdiv d2,d0,d3
		str d2,[x29,36]
		mov w0,w21

		bl funcy

		ldr d2,[x29,36]
		fsub d2,d0,d2
		str d2,[x19],8

		add w21,w21,1
		sub w20,w20 ,1
		b loop

fim:

	ldr w21,[x29,32]
	ldp x19,x29,[x29,16]
	ldp x29,x30,[SP],48



	ret



