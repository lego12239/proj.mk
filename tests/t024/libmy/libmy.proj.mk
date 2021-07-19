PROJECT := libmy
TARGET_TYPE ?= liba
SOURCES := src1.c src2.c src3.c

DEPS := libmya
deps_get_libmya ?= ln $(PROJDIR)/libmya
deps_build_libmya ?= gcc -c -o src1.o -fPIC src1.c; gcc -c -o src2.o -fPIC src2.c;\
  gcc -c -o src3.o -fPIC src3.c;\
  gcc -shared -o libmya.so src1.o src2.o src3.o;\
  install -m 0444 libmya.so $(DEPSDIR)/lib;\
  install -m 0444 mya.h $(DEPSDIR)/include

PROJMKDIR := $(shell A=`pwd`; while [ ! -d $$A/.proj.mk ] ; do A=$${A%/*}; done; echo $$A/.proj.mk)
include $(PROJMKDIR)/c-proj.mk

install: $(TARGET)
	install -d $(D)/lib $(D)/include
	install -m 0444 $(TARGET) $(D)/lib
	install -m 0444 my.h $(D)/include
