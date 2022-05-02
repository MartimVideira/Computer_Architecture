#include <stdio.h>
#include <stdlib.h>



extern float func(float a ,float b, float c ,float d);

int main(){

	float A= 1.3, B = 5.9 , C= 2.1 , D = -2.3;
	float res;
	printf("porrque nao funciona?");
	res = func(A,B,C,D);
	printf("%f \n", res);
	return 0;
}
