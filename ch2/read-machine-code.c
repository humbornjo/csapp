#include<stdio.h>
#include<stdlib.h>

void main(int argc, char **argv) {
	FILE *fileptr;
	char *buffer;
	long filelen;
	fileptr = fopen(argv[1], "rb");  // Open the file in binary mode
	fseek(fileptr, 0, SEEK_END);          // Jump to the end of the file
	filelen = ftell(fileptr);             // Get the current byte offset in the file
	rewind(fileptr);                      // Jump back to the beginning of the file

	buffer = (char *)malloc(filelen * sizeof(char)); // Enough memory for the file
	fread(buffer, filelen, 1, fileptr); // Read in the entire file
	
	for (int i = 0; i < filelen; i++) {
		printf("%.2x", buffer[i]);
	}

	fclose(fileptr); // Close the file
}

