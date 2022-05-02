#include <stdio.h>
#include <stdlib.h>
extern double res(double m, double n , double b);

extern double res1(int w, double x);

int main(){

	double m =3.6, n= 7.1 , b= 7.8;

	double resultado = res(m,n,b);

	printf(" O res : %f",resultado);


	int w = 7;  double x = 7.1;

	double resultado1 = res1(w,x);

	printf("O res1 : %f \n",resultado1);

	return 0;

}
