
#include <stdio.h>
#include <stdlib.h>

extern float histo(unsigned int N, unsigned char *C, unsigned char *H);

int main(void)
{
  unsigned char H[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  float res;
  int i;
  unsigned char C1[] = {15, 18, 5, 20, 9, 10, 1, 12, 16, 7, 14, 8, 10, 14, 14, 16};
  unsigned char C2[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 10, 11, 12, 13, 14, 15, 16, 17, 18, 0, 0};

    //Exemplo 1
  res = histo(16, C1, H);
  printf("Exemplo 1:\n");
  for (i=0; i<21; i++)
    {printf("%d ---> %d\n", i, H[i]); H[i]=0;}
  printf("Média = %f\n\n", res);
    //Exemplo 2
  res = histo(32, C2, H);
  printf("Exemplo 2:\n");
  for (i=0; i<21; i++)
    printf("%d ---> %d\n", i, H[i]);
  printf("Média = %f\n\n", res);
  return 0;
}
