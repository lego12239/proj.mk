PROJECT := libmy
TARGET := libmy.so
SOURCES := src1.c src2.c src3.c

DEPS := libmya
deps_get_libmya ?= cp $(PROJDIR)/libmya
deps_patch_libmya := libmya.patch

include .proj.mk/c-proj.mk
