void cond(short a, short *p) {
  if (a && *p < a)
    *p = a;
}

void go2cond(short a, short *p) {
  if (a == 0)
    goto done;
  if (*p >= a)
    goto done;
  *p = a;
done:
  return;
}

int main() {
  short x = 5, y = 7;
  go2cond(x, &y);
  return 0;
}
