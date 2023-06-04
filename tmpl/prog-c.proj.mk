PROJECT := __MYPROJNAME__
SOURCES := __MYPROJNAME__.c
#SOURCES := main.c another.c

#CFLAGS := -Wno-main -Werror=pedantic -pedantic -std=c11
#LDFLAGS := -L.

#DEPS := libmy
#deps_get_libmy := cp $(shell pwd)/libmy
#deps_patch_libmy := libmy.patch libmy.fix.patch
#deps_ttype_libmya := libso

include .proj.mk/c-proj.mk

install: $(TARGET)
	install -d $(D)/bin
	install -m 0444 $(TARGET) $(D)/bin

