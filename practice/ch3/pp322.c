
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>

#define MEINT long

int main(int argc, char **argv) {
  MEINT increm = 1;
  MEINT stopn = strtol(*(argv + 1), argv + 1, 10);
  printf("stop number is %ld\n", stopn);
  MEINT val = 1;

loop:
  if (val > val * increm)
    printf("overflow occurs at loop %ld, current val is %ld\n", increm, val);

  val *= increm;
  increm++;
  if (increm <= stopn)
    goto loop;

  printf("res number is %ld, iter for %ld loop\n", val, increm - 1);
  printf("while LONG_MAX is %ld\n", LONG_MAX);
}