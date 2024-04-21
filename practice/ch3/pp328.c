// doesnt seem a correct problem
// refer to my ebook
// could get similar output using 'cc -O1 -S pp328.c'
short test_two(unsigned short x) {
  short val = 0;
  short i;
  for (i = 64; i != 0; i--) {
    val = (val << 1) | (x & 1);
    x >>= 1;
  }
  return val;
}