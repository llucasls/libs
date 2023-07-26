#include <stdio.h>

#include <print_array.h>

void print_array(char *array[], char *name, int size) {
	printf("%s: {", name);
	for (int index = 0; index < size - 1; index++)
		printf("\"%s\", ", array[index]);
	printf("\"%s\"}\n", array[size - 1]);
}
