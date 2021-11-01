#ifndef __TESTS_H__
#define __TESTS_H__

#define TERR_OUT(fmt, ...) fprintf(stderr, "%s:%u: " fmt "\n", \
  __FILE__, __LINE__, ##__VA_ARGS__)
#define TERR(fmt, ...) do { TERR_OUT(fmt, ##__VA_ARGS__); return 0; } while (0)
#define TEST_NULL {NULL, NULL}

struct test {
	int (*test)(void);
	char *title;
};

#endif /* __TESTS_H__ */
