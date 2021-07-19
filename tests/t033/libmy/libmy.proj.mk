PROJECT := libmy

DEPS := libmya
deps_get_libmya ?= ln $(PROJDIR)/libmya

all:
	$(MAKE)

PROJMKDIR := $(shell A=`pwd`; while [ ! -d $$A/.proj.mk ] ; do A=$${A%/*}; done; echo $$A/.proj.mk)
include $(PROJMKDIR)/c-proj.mk

%:
	$(MAKE) $@
