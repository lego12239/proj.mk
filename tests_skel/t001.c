#include <stdio.h>
#include <string.h>
#include <errno.h>
#include "../MY.c"


#define TERR_OUT(fmt, ...) fprintf(stderr, "%s:%u: " fmt "\n", \
  __FILE__, __LINE__, ##__VA_ARGS__)
#define TERR(fmt, ...) do { TERR_OUT(fmt, ##__VA_ARGS__); return 0; } while (0)
#define TEST_NULL {NULL, NULL}
struct test {
	int (*test)(void);
	char *title;
};

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

	for(i = 0; tests[i].test; i++)
		total++;

	for(i = 0; tests[i].test; i++) {
		fprintf(stderr, "%s:%s... ", argv[0], tests[i].title);
		ret = tests[i].test();
		fprintf(stderr, "%s\n", ret ? "ok" : "fail");
		if (ret)
			cnt++;
	}

	printf("TOTAL %d/%d\n", cnt, total);
	return cnt != total;
}
