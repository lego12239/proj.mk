PROJECT := libmy
TARGET := libmy.a
SOURCES := src1.c src2.c src3.c

DEPS := libmya
deps_get_libmya ?= ln $(PROJDIR)/libmya

include .proj.mk/c-proj.mk
