#include <stdio.h>

void somefunc1(void);

int
main(int argc, char **argv)
{
	if (argc > 1)
		printf("test: %s\n", argv[1]);
	else
		printf("test\n");
	somefunc1();
	return 0;
}
