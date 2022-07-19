#include<stdio.h>


void ConvertDec2Hex(void *a) {
	unsigned char *ptr = a;

	for (int i = sizeof(int); i >0; i--) {
		printf("%x, %d\n", ptr[i-1], i);
	}

}

void main () {
		unsigned int a = 0;
		printf("%.8x\n",a -1);
		long b = 3510593.0;
		ConvertDec2Hex(&a);
}
	
