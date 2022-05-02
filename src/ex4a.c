#include <stdio.h>
#include <stdlib.h>

extern  long int * extendUB_DW(int len , int *basea,long int *newarr);


int main(){

	char *myarr = { 1, 2 , 3, 4, 5, 6 };
	int len = 6;
	long int *newarr;

	long int  *newarr = extendUB_DW(len,myarr,newarr);
	int b = 4;

	return 0;
}
