.PHONY: tests

tests: t001
	@for i in $^; do \
		./$$i || exit 1; \
	done

t001: t001.c ../MY.c
	gcc -o $@ $< $(LDFLAGS)

