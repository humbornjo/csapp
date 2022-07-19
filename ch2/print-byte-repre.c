#include<stdio.h>

typedef unsigned char *byte_pointer;

void show_bytes(byte_pointer start, size_t len) {
	int i;
	for (i=len;i>0;i--) 
		printf(" %.2x",start[i-1]);
	printf("\n");
}

void show_int(int x) {
	show_bytes((byte_pointer) &x, sizeof(int));
}

int main(){
	int x=12345;
	show_int(x);
}
