#include<stdio.h>


void show_bytes(void * pointer, int len){
	char *bpointer=pointer;
	for (int i=len; i>0; i--){
		printf("%.2x, little endian, in order\n", bpointer[i-1]);
	}
}

