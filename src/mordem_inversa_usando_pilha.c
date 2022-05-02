

#include <stdio.h>
#include <string.h>

extern void switcharu(char *string);

int main(){


	char s[] = "Lara Daniela Ferreira Rodrigues";
	switcharu(s);
	printf("In reverse order : %s",s);


	return 0;
}
