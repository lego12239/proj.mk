PROJECT := libmy
TARGET := libmy.a
SOURCES := src1.c src2.c src3.c

include .proj.mk/c-proj.mk

install: $(TARGET)
	install -d $(D)/lib $(D)/include
	install -m 0444 libmy.a $(D)/lib
	install -m 0444 my.h $(D)/include
