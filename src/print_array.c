#include <stdio.h>

#include <print_array.h>

void print_array(char *array[], char *name) {
	if (name != NULL)
		printf("%s: ", name);
	printf("{");

	int index = 0;
	while(array[index + 1] != NULL) {
		printf("\"%s\", ", array[index]);
		index++;
	}
	printf("\"%s\"}\n", array[index]);
}
