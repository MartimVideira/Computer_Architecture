/*
 ============================================================================
 Name        : MPCP2021.c
 Author      : 
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */
#include <stdio.h>
#include <stdlib.h>



void display_arr(int len , int *baseaddr){
	for (int i= 0 ; i <len ; i++){
		if(i == (len-1))
			printf("%d .",baseaddr[i]);

		else
			printf("%d ->",baseaddr[i]);
	}
}

extern int max_array(int *a , int dim);

int main(){

	int dim = 8;
	int v[] = {1,2,3,4,5, -3,-1,6};
	int res;
	res = max_array(v,dim);
	printf("O resultado é %d",res);
	return 0;
	}
