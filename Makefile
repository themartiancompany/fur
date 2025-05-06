# SPDX-License-Identifier: GPL-3.0-or-later

#    ----------------------------------------------------------------------
#    Copyright © 2024, 2025  Pellegrino Prevete
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
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/fur
DATA_DIR=$(DESTDIR)$(PREFIX)/share/fur
BIN_DIR=$(DESTDIR)$(PREFIX)/bin
MAN_DIR?=$(DESTDIR)$(PREFIX)/share/man

DOC_FILES=\
  $(wildcard *.rst)
_BASH_FILES=\
  "$(_PROJECT)"
_CHECK_FILES=\
  "$(wildcard $(_PROJECT)/*)

_INSTALL_FILE=install -vDm644
_INSTALL_DIR=install -vdm755
_INSTALL_EXE=install -vDm755

all:

check: shellcheck

shellcheck:

	shellcheck -s bash $(_CHECK_FILES)

install: install-fur install-doc

install-doc:

	$(_INSTALL_FILE) \
	  $(DOC_FILES) \
	  -t \
	  $(DOC_DIR)

install-fur:

	$(_INSTALL_EXE) \
	  "$(_PROJECT)/$(_PROJECT)" \
	  "$(BIN_DIR)/$(_PROJECT)"

install-man:

	$(_INSTALL_DIR) \
	  "$(MAN_DIR)/man1"
	for _file in $(_BASH_FILES); do \
	  rst2man \
	    "man/$${_file}.1.rst" \
	    "$(MAN_DIR)/man1/$${_file}.1"; \
	done

.PHONY: check install install-doc install-fur install-man shellcheck
