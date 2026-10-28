ifndef PS5_PAYLOAD_SDK
$(error PS5_PAYLOAD_SDK is not set. Example: export PS5_PAYLOAD_SDK=/opt/ps5-payload-sdk)
endif

ifeq ($(wildcard $(PS5_PAYLOAD_SDK)/toolchain/prospero.mk),)
$(error PS5_PAYLOAD_SDK does not point to an installed PS5 payload SDK: $(PS5_PAYLOAD_SDK))
endif

include $(PS5_PAYLOAD_SDK)/toolchain/prospero.mk

TARGET := build/ppsa01289-diagnostic.elf
SOURCE := src/main.c

CFLAGS += -Wall -Wextra -Werror

.PHONY: all clean
all: $(TARGET)

build:
	mkdir -p build

$(TARGET): $(SOURCE) | build
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -rf build
