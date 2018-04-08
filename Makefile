.PHONY: all clean

EXECUTABLES = packer ansible qemu-system-x86_64
K := $(foreach exec,$(EXECUTABLES),\
        $(if $(shell which $(exec)),some string,$(error "No $(exec) in PATH)))

SHELL=/bin/bash
export CHECKPOINT_DISABLE := 1
export PACKER_CACHE_DIR := \
	$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))/.packer/cache
export VERSION := $(shell date -u +%Y%m%d%H%M)

clean:
	rm -rf dist
	rm -rf .packer/build
	rm -rf ansible/main.retry

all: clean
	packer build --parallel=false packer/build.json
