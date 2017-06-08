.PHONY: all clean

SHELL=/bin/bash
export CHECKPOINT_DISABLE := 1
export PACKER_CACHE_DIR := \
	$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))/.packer/cache
export VERSION := $(shell date -u +%Y%m%d%H%M)

clean:
	rm -rf dist
	rm -rf .packer/build

all: clean
	packer build --parallel=false packer/build.json
