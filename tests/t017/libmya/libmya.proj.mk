PROJECT := libmya
TARGET_TYPE ?= liba
SOURCES := src1.c src2.c src3.c

PROJMKDIR := $(shell A=`pwd`; while [ ! -d $$A/.proj.mk ] ; do A=$${A%/*}; done; echo $$A/.proj.mk)
include $(PROJMKDIR)/c-proj.mk

install: $(TARGET)
	install -d $(D)/lib $(D)/include
	install -m 0444 $(TARGET) $(D)/lib
	install -m 0444 mya.h $(D)/include
