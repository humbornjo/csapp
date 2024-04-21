double funct3(int *ap, double b, long c, float *dp) {
  int a = *ap;
  float d = *dp;
  if (a <= b) {
    return c + 2 * d;
  }
  return c * d;
}

double funct4(int *ap, double b, long c, float *dp) {
  int a = *ap;
  float d = *dp;
  if (a > b) {
    return c * d;
  }
  return c + 3 * d;
}