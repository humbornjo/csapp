#include"./ch2BasicFunc.h"
#include<string.h>

int main(){
	const char *m = "mnopqr";
	show_bytes(&m, strlen(m));
	return 1;
}
