#include <stdio.h>

#include <ravenl/print_array.h>

void print_array(char *array[]) {
	int index = 0;

	printf("{");
	while(array[index + 1] != NULL) {
		printf("\"%s\", ", array[index]);
		index++;
	}
	printf("\"%s\"}\n", array[index]);
}
