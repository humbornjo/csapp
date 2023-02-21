#include<stdio.h>



//declarations
int bis(int x, int m);
int bic(int x, int m);
int bool_or(int x, int y);
int bool_xor(int x, int y);


int bis(int x, int m){
	return x|m;
}

int bic(int x, int m){
	return x&~m;
}

int bool_or(int x, int y){
	return bis(x,y);
}

int bool_xor(int x, int y){
	return bis(bic(x,y), bic(y,x));
}
	

int main(){
	int i,j;

	i=1;
	j=0x01;

	printf("ans: %d", bic(i, j));
	return 0;
}

