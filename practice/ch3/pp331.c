void switcher(long a, long b, long c, long *dest) {
  long val;
  switch (a) {
  case 5: // .L7
    c = a ^ 15;
  case 0: // .L3
    val = c + 112;
    break;
  case 2: // .L5
  case 7:
    val = (a + c) << 2;
    break;
  case 4:
    val = b;
  default: // .L2
    val = a;
  }
  *dest = val;
}