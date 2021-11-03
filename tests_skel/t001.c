#include <stdio.h>
#include <string.h>
#include <errno.h>
#include "tests.h"
#include "../MY.c"


void
init(void)
{
}

int
test0_0(void)
{
	int ret = 1;

	if (!ret)
		TERR("ret must be 1 instead of %d", ret);

	return 1;
}


struct test tests[] = {
	{test0_0, "skel"},
	TEST_NULL
};

int
main(int argc, char **argv)
{
	int i, cnt = 0, ret, total = 0;

	init();

	for(i = 0; tests[i].test; i++)
		total++;

	for(i = 0; tests[i].test; i++) {
		fprintf(stderr, "%s:%s... ", argv[0], tests[i].title);
		ret = tests[i].test();
		fprintf(stderr, "%s\n", ret ? "ok" : "fail");
		if (ret)
			cnt++;
	}

	printf("%s:TOTAL %d/%d\n", argv[0], cnt, total);
	return cnt != total;
}
