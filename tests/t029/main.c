#include <stdio.h>
#include <my.h>

int
main(void)
{
	somefunc1();
#ifdef USE_libmya
	printf("libmya is used\n");
#endif
	return 0;
}

