#include <stdio.h>
#include "my.h"

void
somefunc1(void)
{
#ifdef USE_libmya
	printf("libmy with libmya");
#endif
	mya_somefunc1();
}
