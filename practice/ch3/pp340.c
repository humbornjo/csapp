#include <stdio.h>

#define fix_matrix int **
#define N 16

void fix_set_diag(fix_matrix A, int val) {
  int *Abase = &A[0][0];
  long i = 0;
  long iend = N * (N + 1);

  do {
    *(Abase + i) = val;
    i = i + N + 1;

  } while (i != iend);
}

int main() { return; }