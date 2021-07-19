PROJECT := libmy
TARGET := libmy.so
SOURCES := src1.c src2.c src3.c

DEPS := libmya
deps_get_libmya ?= cp $(PROJDIR)/libmya

include .proj.mk/c-proj.mk
