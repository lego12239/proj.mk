CBLUE := $(shell /bin/echo -e '\033[34;01m')
CGREEN := $(shell /bin/echo -e '\033[32;01m')
CRED := $(shell /bin/echo -e '\033[31;01m')
CRST := $(shell /bin/echo -e '\033[00m')

define infom
echo "$(CBLUE)$(1)$(CRST)"
endef

define fail
{ echo "$(CRED)FAIL$(CRST): " '$(1)'; exit 1; }
endef

define t
	@$(1) || $(call fail,$(1))
endef

.PHONY: tests t001 t001.0 t001.1 t001.2 t001.3\
t002 t002.0 t002.1 t002.2 t002.3 t002.4\
t003 t003.0 t003.1 t003.2 t003.3 t003.4\
t004\
t005 t005.0 t005.1 t005.2 t005.3\
t006 t006.0 t006.1 t006.2 t006.3\
t007 t007.0 t007.1 t007.2 t007.3\
t008 t008.0 t008.1 t008.2 t008.3\
t009 t009.0 t009.1 t009.2 t009.3\
t010 t010.0 t010.1 t010.2 t010.3 t010.4\
t011 t011.0 t011.1 t011.2 t011.3\
t012 t012.0 t012.1 t012.2 t012.3\
t013 t013.0 t013.1 t013.2\
t014 t014.0 t014.1 t014.2\
t015 t015.0 t015.1 t015.2\
t016 t016.0 t016.1 t016.2\
t017 t017.0 t017.1 t017.2\
t018 t018.0 t018.1 t018.2\
t019 t019.0\
t020 t020.0\
t021 t021.0\
t022 t022.0\
t023 t023.0\
t024 t024.0

tests: t001 t002 t003 t004 t005 t006 t007 t008 t009 t010 t011 t012 t013 t014\
t015 t016 t017 t018 t019 t020 t021 t022 t023 t024
	@echo "$(CGREEN)OK$(CRST)"

t001: t001.0 t001.1 t001.2 t001.3

t001.0:
	@$(call infom,1. test simple project with one source file)
	@rm -f t001/myprog || true
	@$(MAKE) --no-print-directory -C t001 || $(call fail)
	@[ -e t001/myprog ] || $(call fail)

t001.1:
	@$(call infom,1.1. test simple project rebuilding)
	@sleep 1s
	@touch t001/myprog.c
	@[ t001/myprog -ot t001/myprog.c ] || $(call fail)
	@sleep 1s
	@$(MAKE) --no-print-directory -C t001 || $(call fail)
	@[ t001/myprog -nt t001/myprog.c ] || $(call fail)

t001.2:
	@$(call infom,1.2. test simple project clean)
	@$(MAKE) --no-print-directory -C t001 clean || $(call fail)
	@[ -e t001/myprog ] || $(call fail)
	@[ ! -e t001/myprog.c.o ] || $(call fail)

t001.3:
	@$(call infom,1.3. test simple project clean-all)
	@$(MAKE) --no-print-directory -C t001 || $(call fail)
	@$(MAKE) --no-print-directory -C t001 clean-all || $(call fail)
	@[ ! -e t001/myprog ] || $(call fail)
	@[ ! -e t001/myprog.c.o ] || $(call fail)

t002: t002.0 t002.1 t002.2 t002.3 t002.4

t002.0:
	@$(call infom,2.0. test project build from several source files)
	@rm -f t002/myprog || true
	@$(MAKE) --no-print-directory -C t002 || $(call fail)
	@[ -e t002/myprog ] || $(call fail)

t002.1:
	@$(call infom,2.1. test project rebuilding)
	@sleep 1s
	@touch t002/myprog.c
	@[ t002/myprog -ot t002/myprog.c ] || $(call fail)
	@sleep 1s
	@$(MAKE) --no-print-directory -C t002 || $(call fail)
	@[ t002/myprog -nt t002/myprog.c ] || $(call fail)

t002.2:
	@$(call infom,2.2. test project rebuilding)
	@sleep 1s
	@touch t002/src2.c
	@[ t002/myprog -ot t002/src2.c ] || $(call fail)
	@sleep 1s
	@$(MAKE) --no-print-directory -C t002 || $(call fail)
	@[ t002/myprog -nt t002/src2.c ] || $(call fail)

t002.3:
	@$(call infom,2.3. test simple project clean)
	@$(MAKE) --no-print-directory -C t002 clean || $(call fail)
	@[ -e t002/myprog ] || $(call fail)
	@[ ! -e t002/myprog.c.o ] || $(call fail)
	@[ ! -e t002/src2.c.o ] || $(call fail)

t002.4:
	@$(call infom,2.4. test simple project clean-all)
	@$(MAKE) --no-print-directory -C t002 || $(call fail)
	@$(MAKE) --no-print-directory -C t002 clean-all || $(call fail)
	@[ ! -e t002/myprog ] || $(call fail)
	@[ ! -e t002/myprog.c.o ] || $(call fail)
	@[ ! -e t002/src2.c.o ] || $(call fail)

t003: t003.0 t003.1 t003.2 t003.3 t003.4

t003.0:
	@$(call infom,3.0. test project build(several targets))
	@rm -f t003/myprog1 t003/myprog2 t003/myprog3 || true
	@$(MAKE) --no-print-directory -C t003 || $(call fail)
	@[ -e t003/myprog1 ] || $(call fail)
	@[ -e t003/myprog2 ] || $(call fail)
	@[ -e t003/myprog3 ] || $(call fail)

t003.1:
	@$(call infom,3.1. test project rebuilding(several targets))
	@sleep 1s
	@touch t003/myprog2.c
	@[ t003/myprog1 -ot t003/myprog2.c ] || $(call fail)
	@[ t003/myprog2 -ot t003/myprog2.c ] || $(call fail)
	@[ t003/myprog3 -ot t003/myprog2.c ] || $(call fail)
	@sleep 1s
	@$(MAKE) --no-print-directory -C t003 || $(call fail)
	@[ t003/myprog1 -ot t003/myprog2.c ] || $(call fail)
	@[ t003/myprog2 -nt t003/myprog2.c ] || $(call fail)
	@[ t003/myprog3 -ot t003/myprog2.c ] || $(call fail)

t003.2:
	@$(call infom,3.2. test project rebuilding(several targets))
	@sleep 1s
	@touch t003/src3.c
	@[ t003/myprog1 -ot t003/src3.c ] || $(call fail)
	@[ t003/myprog2 -ot t003/src3.c ] || $(call fail)
	@[ t003/myprog3 -ot t003/src3.c ] || $(call fail)
	@sleep 1s
	@$(MAKE) --no-print-directory -C t003 || $(call fail)
	@[ t003/myprog1 -nt t003/src3.c ] || $(call fail)
	@[ t003/myprog2 -nt t003/src3.c ] || $(call fail)
	@[ t003/myprog3 -nt t003/src3.c ] || $(call fail)

t003.3:
	@$(call infom,3.3. test project clean(several targets))
	@$(MAKE) --no-print-directory -C t003 clean || $(call fail)
	@[ -e t003/myprog1 ] || $(call fail)
	@[ -e t003/myprog2 ] || $(call fail)
	@[ -e t003/myprog3 ] || $(call fail)
	@[ ! -e t003/myprog1.c.o ] || $(call fail)
	@[ ! -e t003/myprog2.c.o ] || $(call fail)
	@[ ! -e t003/myprog3.c.o ] || $(call fail)
	@[ ! -e t003/src2.c.o ] || $(call fail)
	@[ ! -e t003/src3.c.o ] || $(call fail)
	@[ ! -e t003/src4.c.o ] || $(call fail)

t003.4:
	@$(call infom,3.4. test project clean-all(several targets))
	@$(MAKE) --no-print-directory -C t003 || $(call fail)
	@$(MAKE) --no-print-directory -C t003 clean-all || $(call fail)
	@[ ! -e t003/myprog1 ] || $(call fail)
	@[ ! -e t003/myprog2 ] || $(call fail)
	@[ ! -e t003/myprog3 ] || $(call fail)
	@[ ! -e t003/myprog1.c.o ] || $(call fail)
	@[ ! -e t003/myprog2.c.o ] || $(call fail)
	@[ ! -e t003/myprog3.c.o ] || $(call fail)
	@[ ! -e t003/src2.c.o ] || $(call fail)
	@[ ! -e t003/src3.c.o ] || $(call fail)
	@[ ! -e t003/src4.c.o ] || $(call fail)
	@[ -e t003/myprog1.c ] || $(call fail)
	@[ -e t003/myprog2.c ] || $(call fail)
	@[ -e t003/myprog3.c ] || $(call fail)
	@[ -e t003/src2.c ] || $(call fail)
	@[ -e t003/src3.c ] || $(call fail)
	@[ -e t003/src4.c ] || $(call fail)

t004:
	@$(call infom,4. test build-pre and build-post)
	@$(MAKE) --no-print-directory -C t004 clean-all || $(call fail)
	@rm -f t004/log || true
	@$(MAKE) --no-print-directory -C t004 || $(call fail)
	@[ -e t004/myprog ] || $(call fail)
	@[ -e t004/myprog.c.o ] || $(call fail)
	@[ -e t004/myprog.c ] || $(call fail)
	@diff t004.log.std t004/log || $(call fail)

t005: t005.0 t005.1 t005.2 t005.3

t005.0:
	@$(call infom,5.0. test static lib build)
	@rm -f t005/libmy.a t005/*.o || true
	@$(MAKE) --no-print-directory -C t005 || $(call fail)
	@[ -e t005/libmy.a ] || $(call fail)
	@(cd t005; nm -A libmy.a | sort) | diff - t005.nm.out || $(call fail)

t005.1:
	@$(call infom,5.1. test static lib rebuilding)
	@ar d t005/libmy.a src2.o
	@sleep 1s
	@touch t005/src2.c
	@[ t005/libmy.a -ot t005/src2.c ] || $(call fail)
	@sleep 1s
	@$(MAKE) --no-print-directory -C t005 || $(call fail)
	@[ t005/libmy.a -nt t005/src2.c ] || $(call fail)
	@(cd t005; nm -A libmy.a | sort) | diff - t005.nm.out || $(call fail)

t005.2:
	@$(call infom,5.2. test static lib clean)
	@$(MAKE) --no-print-directory -C t005 clean || $(call fail)
	@[ -e t005/libmy.a ] || $(call fail)
	@[ ! -e t005/src1.o ] || $(call fail)
	@[ ! -e t005/src2.o ] || $(call fail)
	@[ ! -e t005/src3.o ] || $(call fail)

t005.3:
	@$(call infom,5.3. test static lib clean-all)
	@$(MAKE) --no-print-directory -C t005 || $(call fail)
	@$(MAKE) --no-print-directory -C t005 clean-all || $(call fail)
	@[ ! -e t005/libmy.a ] || $(call fail)
	@[ ! -e t005/src1.o ] || $(call fail)
	@[ ! -e t005/src2.o ] || $(call fail)
	@[ ! -e t005/src3.o ] || $(call fail)

t006: t006.0 t006.1 t006.2 t006.3

t006.0:
	@$(call infom,6.0. test static lib build(no TARGET_TYPE))
	@rm -f t006/libmy.a t006/*.o || true
	@$(MAKE) --no-print-directory -C t006 || $(call fail)
	@[ -e t006/libmy.a ] || $(call fail)
	@(cd t006; nm -A libmy.a | sort) | diff - t006.nm.out || $(call fail)

t006.1:
	@$(call infom,6.1. test static lib rebuilding(no TARGET_TYPE))
	@ar d t006/libmy.a src2.c.o
	@sleep 1s
	@touch t006/src2.c
	@[ t006/libmy.a -ot t006/src2.c ] || $(call fail)
	@sleep 1s
	@$(MAKE) --no-print-directory -C t006 || $(call fail)
	@[ t006/libmy.a -nt t006/src2.c ] || $(call fail)
	@(cd t006; nm -A libmy.a | sort) | diff - t006.nm.out || $(call fail)

t006.2:
	@$(call infom,6.2. test static lib clean(no TARGET_TYPE))
	@$(MAKE) --no-print-directory -C t006 clean || $(call fail)
	@[ -e t006/libmy.a ] || $(call fail)
	@[ ! -e t006/src1.c.o ] || $(call fail)
	@[ ! -e t006/src2.c.o ] || $(call fail)
	@[ ! -e t006/src3.c.o ] || $(call fail)

t006.3:
	@$(call infom,6.3. test static lib clean-all(no TARGET_TYPE))
	@$(MAKE) --no-print-directory -C t006 || $(call fail)
	@$(MAKE) --no-print-directory -C t006 clean-all || $(call fail)
	@[ ! -e t006/libmy.a ] || $(call fail)
	@[ ! -e t006/src1.c.o ] || $(call fail)
	@[ ! -e t006/src2.c.o ] || $(call fail)
	@[ ! -e t006/src3.c.o ] || $(call fail)

t007: t007.0 t007.1 t007.2 t007.3

t007.0:
	@$(call infom,7.0. test shared lib build(no TARGET_TYPE))
	@rm -f t007/libmy.so t007/*.o-libso || true
	@$(MAKE) --no-print-directory -C t007 || $(call fail)
	@[ -e t007/libmy.so ] || $(call fail)
	@(cd t007; nm -A  libmy.so  | awk '$$2 == "T" {print $$2,$$3}' | sort) | diff - t007.nm.out || $(call fail)

t007.1:
	@$(call infom,7.1. test shared lib rebuilding(no TARGET_TYPE))
	@sleep 1s
	@touch t007/src2.c
	@[ t007/libmy.so -ot t007/src2.c ] || $(call fail)
	@sleep 1s
	@$(MAKE) --no-print-directory -C t007 || $(call fail)
	@[ t007/libmy.so -nt t007/src2.c ] || $(call fail)
	@(cd t007; nm -A  libmy.so  | awk '$$2 == "T" {print $$2,$$3}' | sort) | diff - t007.nm.out || $(call fail)

t007.2:
	@$(call infom,7.2. test shared lib clean(no TARGET_TYPE))
	@$(MAKE) --no-print-directory -C t007 clean || $(call fail)
	@[ -e t007/libmy.so ] || $(call fail)
	@[ ! -e t007/src1.c.o-libso ] || $(call fail)
	@[ ! -e t007/src2.c.o-libso ] || $(call fail)
	@[ ! -e t007/src3.c.o-libso ] || $(call fail)

t007.3:
	@$(call infom,7.3. test shared lib clean-all(no TARGET_TYPE))
	@$(MAKE) --no-print-directory -C t007 || $(call fail)
	@$(MAKE) --no-print-directory -C t007 clean-all || $(call fail)
	@[ ! -e t007/libmy.so ] || $(call fail)
	@[ ! -e t007/src1.c.o-libso ] || $(call fail)
	@[ ! -e t007/src2.c.o-libso ] || $(call fail)
	@[ ! -e t007/src3.c.o-libso ] || $(call fail)

t008: t008.0 t008.1 t008.2 t008.3

t008.0:
	@$(call infom,8.0. test project with deps)
	@$(MAKE) --no-print-directory -C t008 clean-all || $(call fail)
	@rm -f t008/prog || true
	@$(MAKE) --no-print-directory -C t008 || $(call fail)
	@[ -e t008/prog ] || $(call fail)

t008.1:
	@$(call infom,8.1. test project rebuilding with deps)
	@sleep 1s
	@touch t008/main.c
	@[ t008/prog -ot t008/main.c ] || $(call fail)
	@sleep 1s
	@$(MAKE) --no-print-directory -C t008 || $(call fail)
	@[ t008/prog -nt t008/main.c ] || $(call fail)

t008.2:
	@$(call infom,8.2. test project clean)
	@$(MAKE) --no-print-directory -C t008 clean || $(call fail)
	@[ -e t008/prog ] || $(call fail)
	@[ -e t008/deps ] || $(call fail)
	@[ ! -e t008/main.c.o ] || $(call fail)

t008.3:
	@$(call infom,8.3. test project clean-all)
	@$(MAKE) --no-print-directory -C t008 || $(call fail)
	@$(MAKE) --no-print-directory -C t008 clean-all || $(call fail)
	@[ ! -e t008/prog ] || $(call fail)
	@[ ! -e t008/deps ] || $(call fail)
	@[ ! -e t008/main.c.o ] || $(call fail)

t009: t009.0 t009.1 t009.2 t009.3

t009.0:
	@$(call infom,9.0. test project with deps)
	@$(MAKE) --no-print-directory -C t009 clean-all || $(call fail)
	@rm -f t009/prog || true
	@$(MAKE) --no-print-directory -C t009 || $(call fail)
	@[ -e t009/prog ] || $(call fail)
	@ldd t009/prog | grep libmy\.so >/dev/null 2>&1 || $(call fail)

t009.1:
	@$(call infom,9.1. test project rebuilding with deps)
	@sleep 1s
	@touch t009/main.c
	@[ t009/prog -ot t009/main.c ] || $(call fail)
	@sleep 1s
	@$(MAKE) --no-print-directory -C t009 || $(call fail)
	@[ t009/prog -nt t009/main.c ] || $(call fail)

t009.2:
	@$(call infom,9.2. test project clean)
	@$(MAKE) --no-print-directory -C t009 clean || $(call fail)
	@[ -e t009/prog ] || $(call fail)
	@[ -e t009/deps ] || $(call fail)
	@[ ! -e t009/main.c.o ] || $(call fail)

t009.3:
	@$(call infom,9.3. test project clean-all)
	@$(MAKE) --no-print-directory -C t009 || $(call fail)
	@$(MAKE) --no-print-directory -C t009 clean-all || $(call fail)
	@[ ! -e t009/prog ] || $(call fail)
	@[ ! -e t009/deps ] || $(call fail)
	@[ ! -e t009/main.c.o ] || $(call fail)

t010: t010.0 t010.1 t010.2 t010.3 t010.4 t010.5

t010.0:
	@$(call infom,10.0. test static lib build(multitargettype))
	@rm -f t010/libmy.a t010/*.o || true
	@rm -f t010/libmy.so t010/*.o-libso || true
	@$(MAKE) --no-print-directory -C t010 || $(call fail)
	@[ -e t010/libmy.a ] || $(call fail)
	@[ ! -e t010/libmy.so ] || $(call fail)
	@(cd t010; nm -A libmy.a | sort) | diff - t010.nm.out || $(call fail)

t010.1:
	@$(call infom,10.1. test shared lib build(multitargettype))
	@rm -f t010/libmy.a t010/*.o || true
	@rm -f t010/libmy.so t010/*.o-libso || true
	@TARGET_TYPE=libso $(MAKE) --no-print-directory -C t010 || $(call fail)
	@[ ! -e t010/libmy.a ] || $(call fail)
	@[ -e t010/libmy.so ] || $(call fail)
	@(cd t010; nm -A libmy.so | awk '$$2 == "T" {print $$2,$$3}' | sort) | diff - t010.so.nm.out || $(call fail)

t010.2:
	@$(call infom,10.2. test static lib clean(multitargettype))
	@$(MAKE) --no-print-directory -C t010 || $(call fail)
	@TARGET_TYPE=libso $(MAKE) --no-print-directory -C t010 || $(call fail)
	@$(MAKE) --no-print-directory -C t010 clean || $(call fail)
	@[ -e t010/libmy.a ] || $(call fail)
	@[ -e t010/libmy.so ] || $(call fail)
	@[ ! -e t010/src1.c.o ] || $(call fail)
	@[ ! -e t010/src2.c.o ] || $(call fail)
	@[ ! -e t010/src3.c.o ] || $(call fail)
	@[ -e t010/src1.c.o-libso ] || $(call fail)
	@[ -e t010/src2.c.o-libso ] || $(call fail)
	@[ -e t010/src3.c.o-libso ] || $(call fail)

t010.3:
	@$(call infom,10.3. test shared lib clean(multitargettype))
	@$(MAKE) --no-print-directory -C t010 || $(call fail)
	@TARGET_TYPE=libso $(MAKE) --no-print-directory -C t010 || $(call fail)
	@TARGET_TYPE=libso $(MAKE) --no-print-directory -C t010 clean || $(call fail)
	@[ -e t010/libmy.a ] || $(call fail)
	@[ -e t010/libmy.so ] || $(call fail)
	@[ -e t010/src1.c.o ] || $(call fail)
	@[ -e t010/src2.c.o ] || $(call fail)
	@[ -e t010/src3.c.o ] || $(call fail)
	@[ ! -e t010/src1.c.o-libso ] || $(call fail)
	@[ ! -e t010/src2.c.o-libso ] || $(call fail)
	@[ ! -e t010/src3.c.o-libso ] || $(call fail)

t010.4:
	@$(call infom,10.4. test static lib clean-all(multitargettype))
	@$(MAKE) --no-print-directory -C t010 || $(call fail)
	@TARGET_TYPE=libso $(MAKE) --no-print-directory -C t010 || $(call fail)
	@$(MAKE) --no-print-directory -C t010 clean-all || $(call fail)
	@[ ! -e t010/libmy.a ] || $(call fail)
	@[ -e t010/libmy.so ] || $(call fail)
	@[ ! -e t010/src1.c.o ] || $(call fail)
	@[ ! -e t010/src2.c.o ] || $(call fail)
	@[ ! -e t010/src3.c.o ] || $(call fail)
	@[ -e t010/src1.c.o-libso ] || $(call fail)
	@[ -e t010/src2.c.o-libso ] || $(call fail)
	@[ -e t010/src3.c.o-libso ] || $(call fail)

t010.5:
	@$(call infom,10.5. test shared lib clean-all(multitargettype))
	@$(MAKE) --no-print-directory -C t010 || $(call fail)
	@TARGET_TYPE=libso $(MAKE) --no-print-directory -C t010 || $(call fail)
	@TARGET_TYPE=libso $(MAKE) --no-print-directory -C t010 clean-all || $(call fail)
	@[ -e t010/libmy.a ] || $(call fail)
	@[ ! -e t010/libmy.so ] || $(call fail)
	@[ -e t010/src1.c.o ] || $(call fail)
	@[ -e t010/src2.c.o ] || $(call fail)
	@[ -e t010/src3.c.o ] || $(call fail)
	@[ ! -e t010/src1.c.o-libso ] || $(call fail)
	@[ ! -e t010/src2.c.o-libso ] || $(call fail)
	@[ ! -e t010/src3.c.o-libso ] || $(call fail)

t011: t011.0 t011.1 t011.2 t011.3

t011.0:
	@$(call infom,11.0. test project with deps(deps_ttype_* test))
	@$(MAKE) --no-print-directory -C t011 clean-all || $(call fail)
	@rm -f t011/prog t011/*.o || true
	@$(MAKE) --no-print-directory -C t011 || $(call fail)
	@[ -e t011/prog ] || $(call fail)
	@ldd t011/prog | grep libmy\.so >/dev/null 2>&1 || $(call fail)

t011.1:
	@$(call infom,11.1. test project rebuilding with deps(deps_ttype_* test))
	@sleep 1s
	@touch t011/main.c || $(call fail)
	@[ t011/prog -ot t011/main.c ] || $(call fail)
	@sleep 1s
	@$(MAKE) --no-print-directory -C t011 || $(call fail)
	@[ t011/prog -nt t011/main.c ] || $(call fail)

t011.2:
	@$(call infom,11.2. test project clean)
	@$(MAKE) --no-print-directory -C t011 clean || $(call fail)
	@[ -e t011/prog ] || $(call fail)
	@[ -e t011/deps ] || $(call fail)
	@[ ! -e t011/main.c.o ] || $(call fail)

t011.3:
	@$(call infom,11.3. test project clean-all)
	@$(MAKE) --no-print-directory -C t011 || $(call fail)
	@$(MAKE) --no-print-directory -C t011 clean-all || $(call fail)
	@[ ! -e t011/prog ] || $(call fail)
	@[ ! -e t011/deps ] || $(call fail)
	@[ ! -e t011/main.c.o ] || $(call fail)

t012: t012.0 t012.1 t012.2 t012.3

t012.0:
	@$(call infom,12.0. test project with nested deps(deps_ttype_* test))
	@$(MAKE) --no-print-directory -C t012 clean-all || $(call fail)
	@rm -f t012/prog t012/*.o || true
	@$(MAKE) --no-print-directory -C t012 || $(call fail)
	@[ -e t012/prog ] || $(call fail)
	@ldd t012/prog | grep libmya\.so >/dev/null 2>&1 || $(call fail)

t012.1:
	@$(call infom,12.1. test project rebuilding with nested deps(deps_ttype_* test))
	@sleep 1s
	@touch t012/main.c || $(call fail)
	@[ t012/prog -ot t012/main.c ] || $(call fail)
	@sleep 1s
	@$(MAKE) --no-print-directory -C t012
	@[ t012/prog -nt t012/main.c ] || $(call fail)

t012.2:
	@$(call infom,12.2. test project clean)
	@$(MAKE) --no-print-directory -C t012 clean || $(call fail)
	@[ -e t012/prog ] || $(call fail)
	@[ -e t012/deps ] || $(call fail)
	@[ ! -e t012/main.c.o ] || $(call fail)

t012.3:
	@$(call infom,12.3. test project clean-all)
	@$(MAKE) --no-print-directory -C t012 || $(call fail)
	@$(MAKE) --no-print-directory -C t012 clean-all || $(call fail)
	@[ ! -e t012/prog ] || $(call fail)
	@[ ! -e t012/deps ] || $(call fail)
	@[ ! -e t012/main.c.o ] || $(call fail)

t013: t013.0 t013.1 t013.2

t013.0:
	@$(call infom,13.0. test deps obtain with ln)
	@$(MAKE) --no-print-directory -C t013 clean-all || $(call fail)
	@$(MAKE) --no-print-directory -C t013/libmy clean-all || $(call fail)
	@TARGET_TYPE=libso $(MAKE) --no-print-directory -C t013/libmya clean-all || $(call fail)
	@$(MAKE) --no-print-directory -C t013 || $(call fail)
	@[ -e t013/prog ] || $(call fail)
	@ldd t013/prog | grep libmya\.so >/dev/null 2>&1 || $(call fail)
	@[ -e t013/libmy/libmy.a ] || $(call fail)
	@[ -e t013/libmya/libmya.so ] || $(call fail)

t013.1:
	@$(call infom,13.1. test project clean(deps obtained with ln))
	@$(MAKE) --no-print-directory -C t013 clean || $(call fail)
	@[ -e t013/prog ] || $(call fail)
	@[ -e t013/deps ] || $(call fail)
	@[ ! -e t013/main.c.o ] || $(call fail)
	@[ -e t013/libmy/libmy.a ] || $(call fail)
	@[ -e t013/libmya/libmya.so ] || $(call fail)

t013.2:
	@$(call infom,13.2. test project clean-all(deps obtained with ln))
	@$(MAKE) --no-print-directory -C t013 || $(call fail)
	@$(MAKE) --no-print-directory -C t013 clean-all || $(call fail)
	@[ ! -e t013/prog ] || $(call fail)
	@[ ! -e t013/deps ] || $(call fail)
	@[ ! -e t013/main.c.o ] || $(call fail)
	@[ -e t013/libmy/libmy.a ] || $(call fail)
	@[ -e t013/libmya/libmya.so ] || $(call fail)

t014: t014.0 t014.1 t014.2

t014.0:
	@$(call infom,14.0. test deps obtain with cp)
	@$(MAKE) --no-print-directory -C t014 clean-all || $(call fail)
	@$(MAKE) --no-print-directory -C t014/libmy clean-all || $(call fail)
	@TARGET_TYPE=libso $(MAKE) --no-print-directory -C t014/libmya clean-all || $(call fail)
	@$(MAKE) --no-print-directory -C t014 || $(call fail)
	@[ -e t014/prog ] || $(call fail)
	@ldd t014/prog | grep libmya\.so >/dev/null 2>&1 || $(call fail)
	@[ ! -e t014/libmy/libmy.a ] || $(call fail)
	@[ ! -e t014/libmya/libmya.so ] || $(call fail)

t014.1:
	@$(call infom,14.1. test project clean(deps obtained with cp))
	@$(MAKE) --no-print-directory -C t014 clean || $(call fail)
	@[ -e t014/prog ] || $(call fail)
	@[ -e t014/deps ] || $(call fail)
	@[ ! -e t014/main.c.o ] || $(call fail)
	@[ ! -e t014/libmy/libmy.a ] || $(call fail)
	@[ ! -e t014/libmya/libmya.so ] || $(call fail)
	@[ -e t014/libmy ] || $(call fail)
	@[ -e t014/libmya ] || $(call fail)

t014.2:
	@$(call infom,14.2. test project clean-all(deps obtained with cp))
	@$(MAKE) --no-print-directory -C t014 || $(call fail)
	@$(MAKE) --no-print-directory -C t014 clean-all || $(call fail)
	@[ ! -e t014/prog ] || $(call fail)
	@[ ! -e t014/deps ] || $(call fail)
	@[ ! -e t014/main.c.o ] || $(call fail)
	@[ ! -e t014/libmy/libmy.a ] || $(call fail)
	@[ ! -e t014/libmya/libmya.so ] || $(call fail)
	@[ -e t014/libmy ] || $(call fail)
	@[ -e t014/libmya ] || $(call fail)

t015: t015.0 t015.1 t015.2

t015/libmy/.git:
	@$(call infom,15-prepare)
	cd t015/libmy && tar -xf git.tar

t015/libmya/.git:
	@$(call infom,15-prepare)
	cd t015/libmya && tar -xf git.tar

t015.0: t015/libmy/.git t015/libmya/.git
	@$(call infom,15.0. test deps obtain with git)
	@$(MAKE) --no-print-directory -C t015 clean-all || $(call fail)
	@$(MAKE) --no-print-directory -C t015 || $(call fail)
	@[ -e t015/prog ] || $(call fail)
	@ldd t015/prog | grep libmya\.so >/dev/null 2>&1 || $(call fail)
	@[ ! -e t015/libmy/libmy.a ] || $(call fail)
	@[ ! -e t015/libmya/libmya.so ] || $(call fail)
	@[ -e t015/deps/src/libmy/.git ] || $(call fail)
	@[ -e t015/deps/src/libmya/.git ] || $(call fail)

t015.1: t015/libmy/.git t015/libmya/.git
	@$(call infom,15.1. test project clean(deps obtained with git))
	@$(MAKE) --no-print-directory -C t015 clean || $(call fail)
	@[ -e t015/prog ] || $(call fail)
	@[ -e t015/deps ] || $(call fail)
	@[ ! -e t015/main.c.o ] || $(call fail)
	@[ ! -e t015/libmy/libmy.a ] || $(call fail)
	@[ ! -e t015/libmya/libmya.so ] || $(call fail)
	@[ -e t015/libmy ] || $(call fail)
	@[ -e t015/libmya ] || $(call fail)

t015.2: t015/libmy/.git t015/libmya/.git
	@$(call infom,15.2. test project clean-all(deps obtained with git))
	@$(MAKE) --no-print-directory -C t015 || $(call fail)
	@$(MAKE) --no-print-directory -C t015 clean-all || $(call fail)
	@[ ! -e t015/prog ] || $(call fail)
	@[ ! -e t015/deps ] || $(call fail)
	@[ ! -e t015/main.c.o ] || $(call fail)
	@[ ! -e t015/libmy/libmy.a ] || $(call fail)
	@[ ! -e t015/libmya/libmya.so ] || $(call fail)
	@[ -e t015/libmy ] || $(call fail)
	@[ -e t015/libmya ] || $(call fail)

t016: t016.0 t016.1 t016.2

t016.0:
	@$(call infom,16.0. test deps without TARGET)
	@$(MAKE) --no-print-directory -C t016 clean-all || $(call fail)
	@$(MAKE) --no-print-directory -C t016/libmy clean-all || $(call fail)
	@TARGET_TYPE=libso $(MAKE) --no-print-directory -C t016/libmya clean-all || $(call fail)
	@$(MAKE) --no-print-directory -C t016 || $(call fail)
	@[ -e t016/prog ] || $(call fail)
	@ldd t016/prog | grep libmya\.so >/dev/null 2>&1 || $(call fail)

t016.1:
	@$(call infom,16.1. test project clean(deps without TARGET))
	@$(MAKE) --no-print-directory -C t016 clean || $(call fail)
	@[ -e t016/prog ] || $(call fail)
	@[ -e t016/deps ] || $(call fail)
	@[ ! -e t016/main.c.o ] || $(call fail)
	@[ -e t016/libmy ] || $(call fail)
	@[ -e t016/libmya ] || $(call fail)

t016.2:
	@$(call infom,16.2. test project clean-all(deps without TARGET))
	@$(MAKE) --no-print-directory -C t016 || $(call fail)
	@$(MAKE) --no-print-directory -C t016 clean-all || $(call fail)
	@[ ! -e t016/prog ] || $(call fail)
	@[ ! -e t016/deps ] || $(call fail)
	@[ ! -e t016/main.c.o ] || $(call fail)
	@[ -e t016/libmy ] || $(call fail)
	@[ -e t016/libmya ] || $(call fail)

t017: t017.0 t017.1 t017.2

t017.0:
	@$(call infom,17.0. test deps without .proj.mk dir)
	@$(MAKE) --no-print-directory -C t017 clean-all || $(call fail)
	@$(MAKE) --no-print-directory -C t017/libmy clean-all || $(call fail)
	@TARGET_TYPE=libso $(MAKE) --no-print-directory -C t017/libmya clean-all || $(call fail)
	@$(MAKE) --no-print-directory -C t017 || $(call fail)
	@[ -e t017/prog ] || $(call fail)
	@ldd t017/prog | grep libmya\.so >/dev/null 2>&1 || $(call fail)

t017.1:
	@$(call infom,17.1. test project clean(deps without .proj.mk dir))
	@$(MAKE) --no-print-directory -C t017 clean || $(call fail)
	@[ -e t017/prog ] || $(call fail)
	@[ -e t017/deps ] || $(call fail)
	@[ ! -e t017/main.c.o ] || $(call fail)
	@[ -e t017/libmy ] || $(call fail)
	@[ -e t017/libmya ] || $(call fail)

t017.2:
	@$(call infom,17.2. test project clean-all(deps without .proj.mk dir))
	@$(MAKE) --no-print-directory -C t017 || $(call fail)
	@$(MAKE) --no-print-directory -C t017 clean-all || $(call fail)
	@[ ! -e t017/prog ] || $(call fail)
	@[ ! -e t017/deps ] || $(call fail)
	@[ ! -e t017/main.c.o ] || $(call fail)
	@[ -e t017/libmy ] || $(call fail)
	@[ -e t017/libmya ] || $(call fail)

t018: t018.0 t018.1 t018.2

t018.0:
	@$(call infom,18.0. test deps obtain with custom)
	@$(MAKE) --no-print-directory -C t018 clean-all || $(call fail)
	@TARGET_TYPE=libso $(MAKE) --no-print-directory -C t018/libmya clean-all || $(call fail)
	@$(MAKE) --no-print-directory -C t018 || $(call fail)
	@[ -e t018/prog ] || $(call fail)
	@ldd t018/prog | grep libmya\.so >/dev/null 2>&1 || $(call fail)
	@[ ! -e t018/libmy/libmy.a ] || $(call fail)
	@[ ! -e t018/libmya/libmya.so ] || $(call fail)

t018.1:
	@$(call infom,18.1. test project clean(deps obtained with custom))
	@$(MAKE) --no-print-directory -C t018 clean || $(call fail)
	@[ -e t018/prog ] || $(call fail)
	@[ -e t018/deps ] || $(call fail)
	@[ ! -e t018/main.c.o ] || $(call fail)
	@[ ! -e t018/libmy/libmy.a ] || $(call fail)
	@[ ! -e t018/libmya/libmya.so ] || $(call fail)
	@[ -e t018/libmy ] || $(call fail)
	@[ -e t018/libmya ] || $(call fail)

t018.2:
	@$(call infom,18.2. test project clean-all(deps obtained with custom))
	@$(MAKE) --no-print-directory -C t018 || $(call fail)
	@$(MAKE) --no-print-directory -C t018 clean-all || $(call fail)
	@[ ! -e t018/prog ] || $(call fail)
	@[ ! -e t018/deps ] || $(call fail)
	@[ ! -e t018/main.c.o ] || $(call fail)
	@[ ! -e t018/libmy/libmy.a ] || $(call fail)
	@[ ! -e t018/libmya/libmya.so ] || $(call fail)
	@[ -e t018/libmy ] || $(call fail)
	@[ -e t018/libmya ] || $(call fail)

t019: t019.0

t019.0:
	@$(call infom,19.0. test clean-deps)
	@$(MAKE) --no-print-directory -C t019 clean-all || $(call fail)
	@$(MAKE) --no-print-directory -C t019/libmy clean-all || $(call fail)
	@TARGET_TYPE=libso $(MAKE) --no-print-directory -C t019/libmya clean-all || $(call fail)
	@$(MAKE) --no-print-directory -C t019 || $(call fail)
	@[ -e t019/prog ] || $(call fail)
	@ldd t019/prog | grep libmya\.so >/dev/null 2>&1 || $(call fail)
	@[ ! -e t019/libmy/libmy.a ] || $(call fail)
	@[ ! -e t019/libmya/libmya.so ] || $(call fail)
	@! diff -rq t019/libmy t019/deps/src/libmy >/dev/null 2>&1 || $(call fail)
	@! diff -rq t019/libmya t019/deps/src/libmya >/dev/null 2>&1 || $(call fail)
	@$(MAKE) --no-print-directory -C t019 clean-deps || $(call fail)
	@diff -rq t019/libmy t019/deps/src/libmy >/dev/null 2>&1 || $(call fail)
	@diff -rq t019/libmya t019/deps/src/libmya >/dev/null 2>&1 || $(call fail)

t020: t020.0

t020.0:
	@$(call infom,20.0. test deps_get_* override)
	@$(MAKE) --no-print-directory -C t020 clean-all || $(call fail)
	@$(MAKE) --no-print-directory -C t020/libmy clean-all || $(call fail)
	@TARGET_TYPE=libso $(MAKE) --no-print-directory -C t020/libmya clean-all || $(call fail)
	@$(MAKE) --no-print-directory -C t020 || $(call fail)
	@[ -e t020/prog ] || $(call fail)
	@ldd t020/prog | grep libmya\.so >/dev/null 2>&1 || $(call fail)
	@[ ! -e t020/libmy/libmy.a ] || $(call fail)
	@[ ! -e t020/libmya/libmya.so ] || $(call fail)

t021: t021.0

t021.0:
	@$(call infom,21.0. test USE_DEP macro)
	@$(call t,$(MAKE) --no-print-directory -C t021 clean-all)
	@$(call t,$(MAKE) --no-print-directory -C t021/libmy clean-all)
	@$(call t,$(MAKE) --no-print-directory -C t021/libmya clean-all)
	@$(call t,$(MAKE) --no-print-directory -C t021)
	@$(call t,[ -e t021/prog ])
	@$(call t,[ "`t021/prog`" == "libmy with libmyalibmya is used" ])

t022: t022.0

t022.0:
	@$(call infom,22.0. test project with non-proj.mk dep(with proj.mk.info))
	@$(call t,$(MAKE) --no-print-directory -C t022 clean-all)
	@$(call t,$(MAKE) --no-print-directory -C t022/libmy clean-all)
	@$(call t,rm -f t022/libmya/Makefile t022/libmya/*.o t022/libmya/*.so)
	@$(call t,$(MAKE) --no-print-directory -C t022)
	@$(call t,[ -e t022/prog ])
	@$(call t,ldd t022/prog | grep libmya\.so >/dev/null 2>&1)

t023: t023.0

t023.0:
	@$(call infom,23.0. test project with non-proj.mk dep(with proj.mk.info in db.priv))
	@$(call t,$(MAKE) --no-print-directory -C t023 clean-all)
	@$(call t,$(MAKE) --no-print-directory -C t023/libmy clean-all)
	@$(call t,rm -f t023/libmya/Makefile t023/libmya/*.o t023/libmya/*.so)
	@$(call t,$(MAKE) --no-print-directory -C t023)
	@$(call t,[ -e t023/prog ])
	@$(call t,ldd t023/prog | grep libmya\.so >/dev/null 2>&1)

t024: t024.0

t024.0:
	@$(call infom,24.0. test deps_build_*)
	@$(call t,$(MAKE) --no-print-directory -C t024 clean-all)
	@$(call t,$(MAKE) --no-print-directory -C t024/libmy clean-all)
	@$(call t,rm -f t024/libmya/Makefile t024/libmya/*.o t024/libmya/*.so)
	@$(call t,$(MAKE) --no-print-directory -C t024)
	@$(call t,[ -e t024/prog ])
	@$(call t,ldd t024/prog | grep libmya\.so >/dev/null 2>&1)

