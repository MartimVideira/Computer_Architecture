#include <stdio.h>
#include <stdlib.h>

extern void closestCircle(unsigned int np, float *vp, unsigned int nc, double *vc, int *id);

int main(void)
{

  unsigned int NP = 2;  // Nº pontos
  unsigned int NC = 4;  // Nº circunferências
  int ID[] = {-1, -1};
  //Exemplo 1: VP1 e VC1
  float VP1[] = {-1.0, 0.0, 2.7, 1.15};
  double VC1[]= {-4.0, -1.0, 1.0, -3.89, 5.4, 0.51, 2.0, 1.0, 1.0, 3.0, 1.21, 0.9};
  //Exemplo 2: VP2 e VC2
  float VP2[] = {-3.0, 1.0, -3.0, -1.5};
  double VC2[]= {0.0, -6.0, 6.0, -10.0, 0.0, 10.75, 0.0, 0.0, 5.0};
  int i;

  /*
  closestCircle(NP, VP1, NC, VC1, ID);
  printf("Exemplo 1: ID = ");
  for (i=0; i<NP; i++)
    {printf("%d ", ID[i]); ID[i]=-1;}
  printf("\n");
  closestCircle(NP, VP2, 3, VC2, ID);
  printf("Exemplo 2: ID = ");
  for (i=0; i<NP; i++)
    printf("%d ", ID[i]);
  printf("\n");
  */
  float VP3[] = {0.0,0.0};

  double VC3[] = {0.0,1.0,0.5 ,0.0,-1.0,0.5,-1.0,0.0,0.5,6.0,7.1,1.0,0.0,0.0,0.5};
  closestCircle(1, VP3, 5, VC3, ID);
    printf("Exemplo 3: ID = ");
    for (i=0; i<NP; i++)
      printf("%d ", ID[i]);
    printf("\n");
  return 0;
}
