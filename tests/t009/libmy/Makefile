PROJECT := libmy
TARGET := libmy.so
SOURCES := src1.c src2.c src3.c

include .proj.mk/c-proj.mk

install: $(TARGET)
	install -d $(D)/lib $(D)/include
	install -m 0444 libmy.so $(D)/lib
	install -m 0444 my.h $(D)/include
