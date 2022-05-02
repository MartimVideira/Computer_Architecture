#include <stdlib.h>
#include <stdio.h>


extern unsigned int Maxsumsubseq( unsigned int v [] , unsigned int N );

int main(){

	unsigned int vect []={2 , 4 , 6 , 5 , 9 , 8 , 8};
	printf ("%u\n", Maxsumsubseq(vect , 7) );


	return 0;
}
