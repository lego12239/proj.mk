PROJECT := __MYPROJNAME__
TARGET_TYPE ?= liba
SOURCES := __MYPROJNAME__.c
#SOURCES := src1.c src2.c src3.c

#CFLAGS := -Werror=pedantic -pedantic -std=c11
#LDFLAGS := -L.

#DEPS := libmya
#deps_get_libmya ?= ln $(PROJDIR)/libmya

PROJMKDIR := $(shell A=`pwd`; while [ ! -d $$A/.proj.mk ] ; do A=$${A%/*}; done; echo $$A/.proj.mk)
include $(PROJMKDIR)/c-proj.mk

install: $(TARGET)
	install -d $(D)/lib $(D)/include
	install -m 0444 $(TARGET) $(D)/lib
	install -m 0444 my.h $(D)/include
