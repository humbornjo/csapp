#include <stdio.h>

long lt_cnt = 0;
long ge_cnt = 0;

long absdiff_se(long x, long y) {
  long result;
  if (x < y) {
    lt_cnt++;
    result = y - x;
  } else {
    ge_cnt++;
    result = x - y;
  }
  printf("result is %ld\n", result);
  return result;
}

long gotodiff_se(long x, long y) {
  long result;
  if (x >= y)
    goto x_ge_y;
  lt_cnt++;
  result = y - x;
  goto done;
x_ge_y:
  ge_cnt++;
  result = x - y;
done:
  printf("result is %ld\n", result);
  return result;
}

int main() {
  long x = 30, y = 20;
  absdiff_se(x, y);

  gotodiff_se(x, y);
}