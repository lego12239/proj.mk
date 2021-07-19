PROJECT := libmya
TARGET_TYPE ?= liba
SOURCES := src1.c src2.c src3.c

include $(TARGET_TYPE).mk

install: $(TARGET)
	install -d $(D)/lib $(D)/include
	install -m 0444 $(TARGET) $(D)/lib
	install -m 0444 mya.h $(D)/include
