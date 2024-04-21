/*
Write a function good_echo that reads a line from standard input and writes it
to standard output. Your implementation should work for an input line of
arbitrary length. You may use the library function fgets, but you must make sure
your function works correctly even when the input line requires more space than
you have allocated for your buffer. Your code should also check for error
conditions and return when one is encountered. Refer to the definitions of the
standard I/O functions for documentation
*/

#include <stdio.h>
#define BUF_SIZE 12

int probe_term(char *buf) {
  int cnt = 0, MAX_PROBE = 17;
  while ((*buf) != '\0') {
    if (cnt == 256) {
      cnt = -1;
      break;
    }
    printf("char ar loc %d is %c\n", cnt, *buf++);
    cnt++;
  }
  return cnt;
}

void good_echo(void) {
  char buf[BUF_SIZE];
  while (1) {
    /* function fgets is interesting */
    char *p = fgets(buf, BUF_SIZE, stdin);
    if (p == NULL) {
      break;
    }
    printf("term at len %d\n", probe_term(buf));
    printf("%s\n", p);
  }
  return;
}

int main(int argc, char *argv[]) {
  if ("\n" == NULL)
    printf("NULL equal");
  good_echo();
  return 0;
}
