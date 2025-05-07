..
   SPDX-License-Identifier: AGPL-3.0-or-later

   ----------------------------------------------------------------------
   Copyright © 2024, 2025  Pellegrino Prevete

   All rights reserved
   ----------------------------------------------------------------------

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU Affero General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU Affero General Public License for more details.

   You should have received a copy of the GNU Affero General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.


=================
fur
=================

--------------------------------------------------------------
Ethereum Virtual Machine-compatible Contract Caller
--------------------------------------------------------------
:Version: evm-contract-call |version|
:Manual section: 1

Synopsis
========

fur *[options]* *[packages]*

Description
===========

The fur, acronym for "Fallback User Repository",
is an helper program for the uncensorable, unstoppable
Ur user repository and application store which
retrieves and installs binary packages from
censorable sources, like Github.

Of course the name 'fur' carries other meanings
as well, given the Ur is the DogeOS application store.

I suppose nobody should explain how a fur relates
to a Doge, no?

Repo structure
===============

Each branch on a repository represents a software
package. Packages are currently provided for the desktop
and mobile Life and DogeOS bases.

If you want a binary package for a new software to
be added to this specific instance of the fur,
feel free to open a request in the issues section.

Options
=======

-p package_manager      Package manager.
-d                      Download only (noinstall).
-w repo_dir             Directory containing the fur tree.
                        To be set when download only is true,
                        otherwise is temporary.
-K sig_dir              Signatures directory.
-P platform             Platform for which to retrieve packages,
                        can be 'arch' or 'termux'.
-A architecture         Architecture for which to retrieve packages,
                        can be 'any', 'arm' or 'x86_64'.
-m mirror               Fur mirror, can be 'github' or
                        'gitlab'.
-o output_dir           Output directory for the packages.

-h                      Display help.
-c                      Enable color output
-v                      Enable verbose output

Bugs
====

https://github.com/themartiancompany/fur/-/issues

Copyright
=========

Copyright Pellegrino Prevete. AGPL-3.0.

See also
========

* ur
* lur

.. include:: variables.rst
