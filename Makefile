# Makefile for hello-sdk-module

TARGET ?= hello-sdk-module
TARGET_IP ?= 192.168.7.2
KERNEL_SRC ?= ${SDKTARGETSYSROOT}/usr/src/kernel

# This Makefile is used to build the hello-sdk-module kernel module.
# It assumes that the kernel source is located at $(KERNEL_SRC) and
# that the current directory contains the source code for the module.
obj-m := $(TARGET).o
SRC := $(shell pwd)

all: $(TARGET).ko

phony+=modules_prepare
modules_prepare:
	$(MAKE) -C $(KERNEL_SRC) modules_prepare

$(TARGET).ko: modules_prepare
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules

phony+=modules_install
modules_install:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install

phony+=clean
clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) clean

phony+=install
install: $(TARGET).ko
	scp $< root@$(TARGET_IP):/home/root/

.PHONY: $(phony)
