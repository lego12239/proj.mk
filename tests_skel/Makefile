.PHONY: tests

TESTS := t001

tests: $(TESTS)
	@for i in $^; do \
		./$$i || exit 1; \
	done

clean:
	rm -f $(TESTS) *.o

t001: t001.c ../MY.c
	gcc -o $@ $< $(LDFLAGS)

