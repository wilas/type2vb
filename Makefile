#
# Makefile for keys2vb.py script
#
# Copyright (c) 2014, Kamil Wilas (wilas.pl)
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
.PHONY: all

# where place files
PREFIX ?= /usr/local/bin

# get info about env.
PY_DEFAULT := $(shell command -v python 2>&1)

# install command
INSTALL := install

# place for tmp files
BUILD_DIR := build_src

# what scripts install/uninstall
PY_TARGET := type2vb.py


all:
	@printf "usage:\tmake install\n"
	@printf "\tmake uninstall\n"

install: check-install
	mkdir -p $(BUILD_DIR)
	@sed '1,1 s:#!/usr/bin/python:#!$(PY_SHEBANG):; 1,1 s:"::g' $(PY_TARGET) > $(BUILD_DIR)/$(PY_TARGET).tmp
	$(INSTALL) -m 0755 -d $(PREFIX)
	$(INSTALL) -m 0755 -p $(BUILD_DIR)/$(PY_TARGET).tmp $(PREFIX)/$(PY_TARGET)
	rm -rf $(BUILD_DIR)

uninstall:
	cd $(PREFIX) && rm -f $(PY_TARGET)

clean:
	rm -rf $(BUILD_DIR)

check-install:
ifndef PY_SHEBANG
  ifndef PY_DEFAULT
    $(error "python command not available")
  endif
  PY_SHEBANG := $(PY_DEFAULT)
endif
