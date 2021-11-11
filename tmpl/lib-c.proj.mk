PROJECT := __MYPROJNAME__
TARGET_TYPE ?= liba
SOURCES := __MYPROJNAME__.c
#SOURCES := src1.c src2.c src3.c

#DEPS := libmya
#deps_get_libmya ?= ln $(PROJDIR)/libmya

include .proj.mk/c-proj.mk

install: $(TARGET)
	install -d $(D)/lib $(D)/include
	install -m 0444 $(TARGET) $(D)/lib
	install -m 0444 my.h $(D)/include
