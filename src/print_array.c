#include <stdio.h>

#include <print_array.h>

int get_size(char *array[]) {
	int index = 0;
	while (array[index] != NULL) index++;

	return index;
}

void print_array(char *array[], char *name) {
	int size = get_size(array);

	if (name != NULL)
		printf("%s: ", name);
	printf("{");

	for (int index = 0; index < size - 1; index++)
		printf("\"%s\", ", array[index]);
	printf("\"%s\"}\n", array[size - 1]);
}
