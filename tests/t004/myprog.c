#include <stdio.h>

int
main(int argc, char **argv)
{
	if (argc > 1)
		printf("test: %s\n", argv[1]);
	else
		printf("test\n");
	return 0;
}
