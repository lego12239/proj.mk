libmya.so: src1.o src2.o src3.o
	$(CC) -shared -o $@ $^

%.o: %.c
	$(CC) -c -o $@ -fPIC $(CFLAGS) $<

install: libmya.so
	install -d $(DESTDIR)/$(PREFIX)/lib $(DESTDIR)/$(PREFIX)/include
	install -m 0444 libmya.so $(DESTDIR)/$(PREFIX)/lib
	install -m 0444 mya.h $(DESTDIR)/$(PREFIX)/include

clean-all:
	rm -f *.o libmya.so
