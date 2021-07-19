all: libmy.a

libmy.a: src1.o src2.o src3.o
	$(AR) rvs $@ $^

install: libmy.a
	install -d $(DESTDIR)/lib $(DESTDIR)/include
	install -m 0444 libmy.a $(DESTDIR)/lib
	install -m 0444 my.h $(DESTDIR)/include

%.o: %.c
	$(CC) -c -o $@ $(CFLAGS) $<

clean:
	rm -f *.o *~

clean-all: clean
	rm -f libmy.a
