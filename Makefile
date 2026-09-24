# SPDX-License-Identifier: GPL-3.0-or-later

#    ----------------------------------------------------------------------
#    Copyright © 2024, 2025, 2026  Pellegrino Prevete
#
#    All rights reserved
#    ----------------------------------------------------------------------
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.

PREFIX ?= /usr/local
_PROJECT=fur
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/$(_PROJECT)
DATA_DIR=$(DESTDIR)$(PREFIX)/share/$(_PROJECT)
BIN_DIR=$(DESTDIR)$(PREFIX)/bin
MAN_DIR?=$(DESTDIR)$(PREFIX)/share/man

DOC_FILES=\
  $(wildcard *.rst)
_BASH_FILES=\
  "$(_PROJECT)"
_CHECK_FILES=\
  $(wildcard $(_PROJECT)/*)

_INSTALL_FILE=\
  install \
    -vDm644
_INSTALL_DIR=\
  install \
    -vdm755
_INSTALL_EXE=\
  install \
  -vDm755

all: build-man

build-man:

	git \
	  submodule \
	    update \
	    --init \
	      "man" || \
	true
	mkdir \
	  -p \
	  "build/man"
	cd \
	  "man"; \
	make \
	  build-man
	cp \
	  "man/build/"* \
	  "build/man"

check: shellcheck

shellcheck:

	shellcheck \
	  -s \
	    "bash" \
	  $(_CHECK_FILES)

install: install-$(_PROJECT) install-doc install-man

install-configs:

	$(_INSTALL_DIR) \
	  "$(DATA_DIR)"
	cp \
	  -r \
	  "configs" \
	  "$(DATA_DIR)"

install-doc:

	$(_INSTALL_FILE) \
	  $(DOC_FILES) \
	  -t \
	  $(DOC_DIR)

install-$(_PROJECT):

	make \
	  install-configs
	$(_INSTALL_EXE) \
	  "$(_PROJECT)/$(_PROJECT)" \
	  "$(BIN_DIR)/$(_PROJECT)"

install-man:

	make \
	  build-man
	cd \
	  "man"; \
	make \
	  install-man

uninstall: uninstall-configs uninstall-$(_PROJECT) uninstall-man

uninstall-configs:

	rm \
	  -rf \
	  "$(DATA_DIR)"

uninstall-man:

	for _file in $(_BASH_FILES); do \
	  rm \
	    -f \
	    "$(MAN_DIR)/man1/$${_file}.1"; \
	done

uninstall-$(_PROJECT):

	rm \
	  -rf \
	  "$(BIN_DIR)/$(_PROJECT)"

.PHONY: check install install-configs install-doc install-$(_PROJECT) install-man shellcheck uninstall uninstall-configs uninstall-man uninstall-$(_PROJECT)
