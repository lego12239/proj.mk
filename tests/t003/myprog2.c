#include <stdio.h>

void somefunc2(void);

int
main(int argc, char **argv)
{
	if (argc > 1)
		printf("test: %s\n", argv[1]);
	else
		printf("test\n");
	somefunc2();
	return 0;
}
