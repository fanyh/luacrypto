all: crypto.so

BUILD_DIR= usr/include/lua
INCLUDE_DIR=$(BUILD_DIR)/include
CFLAGS = -g3 -O2 -rdynamic -Wall -I$(INCLUDE_DIR)
LDFLAGS= -lcrypto
crypto.so: lcrypto.h lcrypto_compat_110.h lcrypto.c
	gcc $(CFLAGS) -fPIC --shared $^ -o $@ $(LDFLAGS)

test:
	lua test_crypto.lua

clean:
	-rm crypto.so
