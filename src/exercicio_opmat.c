#include <stdio.h>
#include <stdlib.h>

extern int OpMat(char nc, char nl, unsigned char *o, unsigned char *v);

int main(void)
{
  unsigned char ncol = 4;  // Nº colunas da matriz
  unsigned char nlin = 3;  // Nº linhas da matriz
  unsigned char mat[] = { 29, 127,  11, 255,
                         100,   5, 200,   0,
                           1,  29,   0, 128 };
  //unsigned char ops[] = {'L', 1, 33, 'C', 2, 99, 'X', 'B', 'C', 0, 111};
  unsigned char ops2[]= {'L', 1, 33, 'C', 2, 99, 'O', 33, 'B', 'C', 0, 123, 'O', 255, 'P', 2, 0, 26, 'X'};   // Exemplo b)

  //unsigned char opstest[] ={ 'L',0,24,'O',24,'X'};
  int  res;
  char i, j;

  res  = OpMat(ncol, nlin, ops2, mat);
  printf("Retorno de OpMat = %d\n", res);
  for (i=0; i<nlin; i++)
  {
      for (j=0; j<ncol; j++)
          printf("%*d", 4, mat[i*ncol+j]);
      printf("\n");
  }
  printf("\n");
  return 0 ;
}

