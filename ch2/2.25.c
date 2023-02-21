#include<stdio.h>

float sum_elements(float a[], unsigned length){
	int i;
	float result = 0;

	for(i = 0; i <= length-1; i++){
		if(i==1) printf("hi here %d %d\n", i, i==1);
		//printf("hi here %d %d\n", i, i==1);
		result +=a[i];
	}
	return result;
}


int main(){
	float a[] = {1,2,3,4};
	int length = 0;
	return sum_elements(a, length);
} 
