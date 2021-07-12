# Licensed under 2-clause BSD license. See LICENSE file.
# Copyright 2021 Oleg Nemanov <lego12239@yandex.ru>
# https://github.com/lego12239/proj.mk

ifeq ($(PROJECT),)
$(error PROJECT variable is't defined)
endif

# Set target and target type
TARGET ?= $(PROJECT)

ifeq ($(TARGET_TYPE),)
ifeq ($(suffix $(TARGET)),.a)
TARGET_TYPE := liba
else ifeq ($(suffix $(TARGET)),.so)
TARGET_TYPE := libso
else
TARGET_TYPE := prog
endif
endif

# Check target type value
ifeq ($(TARGET_TYPE),prog)
else ifeq ($(TARGET_TYPE),liba)
else ifeq ($(TARGET_TYPE),libso)
else
$(error unknown TARGET_TYPE: $(TARGET_TYPE))
endif

$(info TARGET_TYPE is $(TARGET_TYPE))

CCYAN := $(shell /bin/echo -e '\033[36;01m')
CRST := $(shell /bin/echo -e '\033[00m')
projmk_infomsg = echo "$(CCYAN)[$(1)]$(CRST)"

DESTDIR ?= /
PREFIX ?= /usr/local
D := $(DESTDIR)/$(PREFIX)
O ?= o

ifdef DEPSDIR
DEPS_ME_IS_DEP := 1
endif

PROJDIR ?= $(shell pwd)
DEPSDIR ?= $(PROJDIR)/deps/
PROJMKDIR := $(shell pwd)/.proj.mk
DEPS_VARS_RMDUPS += CFLAGS LDFLAGS
DEPS_VARS_EXPORT += CFLAGS LDFLAGS

CFLAGS += -Wall -Werror=implicit -I$(shell pwd) -I$(DEPSDIR)/include
LDFLAGS += -L$(DEPSDIR)/lib

ifdef DEBUG
	CFLAGS += -g3 -ggdb -DDEBUG
endif

export PROJDIR
export DEPSDIR
export PROJMKDIR
export DEBUG

.PHONY: deps deps_ deps_show deps_genfullinfo
.PHONY: build build-pre build-post
.PHONY: clean clean-all clean-deps clean-tests tests

#ifneq ($(MAKECMDGOALS),deps_show)
#DEPS := $(shell $(MAKE) deps_show)
#endif
#DEPS_REV := $(shell echo $(DEPS) | $(PROJMKDIR)/revdeps.sh)
#DEPS := $(shell echo $(DEPS_REV) | $(PROJMKDIR)/revdeps.sh)

DEPS := $(shell $(PROJMKDIR)/stripslash.sh $(DEPS))
ifneq ($(.SHELLSTATUS),0)
$(error DEPS set failure)
endif


######################################################################
# TEMPLATES FOR include statements
######################################################################
define _deps_gen_incl
include $(DEPSDIR)/src/$(1).proj.mk.info

endef

######################################################################
# TEMPLATES FOR deps_show TARGET
######################################################################
define _deps_gen_show
	$(if $(shell test -e $(DEPSDIR)/src/$(1)/.proj.mk && echo t),\
	  @$(MAKE) --no-print-directory -C $(DEPSDIR)/src/$(1) deps_show)

endef

######################################################################
# TEMPLATES FOR GET STAGE
######################################################################
define _deps_gen_get_ln
	if [ -e $(DEPSDIR)/src/$(1) ]; then \
		rm -rf $(DEPSDIR)/src/$(1); \
	fi
	ln -Ts $(word 2,$(2)) $(DEPSDIR)/src/$(1)
endef

define _deps_gen_get_cp
	if [ -e $(DEPSDIR)/src/$(1) ]; then \
		rm -rf $(DEPSDIR)/src/$(1); \
	fi
	cp -rf $(word 2,$(2)) $(DEPSDIR)/src/$(1)
endef

define _deps_gen_get_git
	if [ -d $(DEPSDIR)/src/$(1)/.git ]; then \
		cd $(DEPSDIR)/src/$(1) && git pull; \
	elif [ -e $(DEPSDIR)/src/$(1) ]; then \
		rm -rf $(DEPSDIR)/src/$(1); \
		git clone $(word 2,$(2)) $(DEPSDIR)/src/$(1); \
	fi
	$(if $(word 3,$(2)),cd $(DEPSDIR)/src/$(1) && git checkout $(word 3,$(2)))
endef

define _deps_gen_get_wget
	if [ -e $(DEPSDIR)/src/$(1) ]; then \
		rm -rf $(DEPSDIR)/src/$(1); \
	fi
	wget -O $(DEPSDIR)/src/$(1).WK "$(word 2,$(2))"
	$(PROJMKDIR)/dep_unpack.sh $(1)
endef

define _deps_gen_get_custom
	$(2)
endef

define _deps_gen_get
	$(call _deps_gen_get_$(word 1,$(2)),$(1),$(2))
endef

######################################################################
# TEMPLATES FOR BUILD STAGE
######################################################################
define _deps_gen_build
	cd $(DEPSDIR)/src/$(1) && { $(2); }
endef

define _deps_gen_build_configure
	cd $(DEPSDIR)/src/$(1) && ./configure --prefix=/ ; \
	$$(MAKE) -C $(DEPSDIR)/src/$(1)
endef

define _deps_gen_build_default
	$(if $(deps_ttype_$(1)),TARGET_TYPE=$(deps_ttype_$(1))) $$(MAKE) -C $(DEPSDIR)/src/$(1)
endef

define _deps_gen_build_detect
	$(if $(shell test -e $(DEPSDIR)/src/$(1)/configure && echo t),\
	  $(call _deps_gen_build_configure,$(1)),\
	  $(call _deps_gen_build_default,$(1)))
endef

######################################################################
# TEMPLATES FOR DEPS TARGETS
######################################################################
define _deps_gen_targets
$(DEPSDIR)/src/$(1).proj.mk.info: $(DEPSDIR)/src/.$(1).get
	@$(call projmk_infomsg,BUILD $(1))
	if [ -e $(DEPSDIR)/src/$(1) ]; then \
		$(if $(deps_build_$(1)),$(call _deps_gen_build,$(1),\
		  $(deps_build_$(1))),$(call _deps_gen_build_detect,$(1))); \
		$(if $(deps_ttype_$(1)),TARGET_TYPE=$(deps_ttype_$(1))) $$(MAKE) -C $(DEPSDIR)/src/$(1) DESTDIR=$(DEPSDIR) PREFIX=/ install; \
	fi
	@$(call projmk_infomsg,GENERATE info file for $(1))
	echo USE__$(1) := 1 > $(DEPSDIR)/src/$(1).proj.mk.info
	if [ -e $(DEPSDIR)/src/$(1)/.proj.mk ]; then \
		$$(MAKE) -C $(DEPSDIR)/src/$(1) deps_genfullinfo; \
	elif [ -e $(PROJMKDIR)/$(1).proj.mk.info ]; then \
		echo include $(PROJMKDIR)/$(1).proj.mk.info >> $(DEPSDIR)/src/$(1).proj.mk.info; \
	elif pkg-config --exists $(1); then \
		echo CFLAGS += `pkg-config --cflags $(1)` >> $(DEPSDIR)/src/$(1).proj.mk.info; \
		echo LDFLAGS += `pkg-config --libs $(1)` >> $(DEPSDIR)/src/$(1).proj.mk.info; \
	else \
		echo >> $(DEPSDIR)/src/$(1).proj.mk.info; \
	fi

$(DEPSDIR)/src/.$(1).get: $(DEPSDIR)/.deps_dirs
	@$(call projmk_infomsg,OBTAIN $(1))
	$(if $(deps_get_$(1)),$(call _deps_gen_get,$(1),$(deps_get_$(1))))
	touch $$@

endef


build: build-pre $(TARGET) build-post

build-pre::
	$(if $(DEPS_ME_IS_DEP),,@$(call projmk_infomsg,BUILD $(PROJECT)))

build-post::

# Generate rules for dependencies
$(foreach dep,$(DEPS),$(eval $(call _deps_gen_targets,$(dep))))

# Generate include statements for dependencies
ifeq ($(or $(if $(filter deps_,$(MAKECMDGOALS)),yes),$(if $(MAKECMDGOALS),,yes)),yes)
DEPS_BACKUP := $(DEPS)
#$(shell echo $(DEPS) >&2)
$(foreach dep,$(DEPS_BACKUP),$(eval $(call _deps_gen_incl,$(dep))))
DEPS := $(DEPS_BACKUP)
endif

# Generate export statements for all USE_* variables, deps_ttype_* variables
# and variables specified in DEPS_VARS_EXPORT variable.
$(foreach var,$(filter USE_%,$(.VARIABLES)),$(eval export $(var)))
$(foreach var,$(filter deps_ttype_%,$(.VARIABLES)),$(eval export $(var)))
$(foreach var,$(DEPS_VARS_EXPORT),$(eval export $(var)))

# Add USE_* variables to CFLAGS
$(foreach var,$(filter USE_%,$(.VARIABLES)),$(eval CFLAGS += -D$(var)=$($(var))))

# Remove duplicates words from variables values which names specified
# in DEPS_VARS_RMDUPS variable.
$(foreach var,$(DEPS_VARS_RMDUPS),$(eval $(var) := $(shell echo $($(var)) | $(PROJMKDIR)/rmdups.sh)))

qqq:
	echo $(DEPS)
	echo $(LDFLAGS)

deps_genfullinfo:
	if [ -e $(PROJECT).proj.mk.info ]; then \
		echo include $(DEPSDIR)/src/$(PROJECT)/$(PROJECT).proj.mk.info >> $(DEPSDIR)/src/$(PROJECT).proj.mk.info; \
	fi
	$(foreach dep,$(DEPS),echo include $(DEPSDIR)/src/$(dep).proj.mk.info >> $(DEPSDIR)/src/$(PROJECT).proj.mk.info)

deps:
	rm -f $(DEPSDIR)/src/*.proj.mk.info
	$(MAKE) deps_

deps_:

$(DEPSDIR)/.deps_dirs:
	install -d $(DEPSDIR)
	install -d $(DEPSDIR)/lib
	install -d $(DEPSDIR)/include
	install -d $(DEPSDIR)/src
	touch $@

deps_show:
	@echo $(DEPS)
	$(foreach dep,$(DEPS),$(call _deps_gen_show,$(dep)))

clean-all:: clean clean-tests clean-deps
	rm -f $(TARGET)

clean-deps::
	rm -rf $(DEPSDIR)/

clean-tests::
	$(MAKE) -C tests clean || true

clean::
	rm -f *~ *.$(O)

tests:
	$(MAKE) -C tests
