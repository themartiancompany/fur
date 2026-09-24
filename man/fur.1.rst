..
   SPDX-License-Identifier: AGPL-3.0-or-later

   ----------------------------------------------------------------------
   Copyright © 2024, 2025, 2026  Pellegrino Prevete

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
Fallback User Repository
--------------------------------------------------------------
:Version: fur |version|
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
censorable sources, like Github and Gitlab.

Of course the name 'fur' carries other meanings
as well, given the Ur is the DogeOS application store.

I suppose nobody should explain how a fur relates
to a Doge, no?


Repo structures
================

The fur program supports retrieving binary
packages from Github and Gitlab using two different
structures.

* The "tree" structure foresees the target namespace
  providing a single Git repository (by default the public
  one is named 'fur', see the -l option below).

  The only exception to the above rule is the
  "main" branch, which contains the fur program
  source code.

* The "ci" structure foresees having made available in
  the universal recipe repository the build platform
  (currently 'github' or 'gitlab') continuous integration
  files for one of the supported platforms.

Packages are provided for desktop
and mobile Life and DogeOS bases.

If you want to propose a package for inclusion
in The Martian Company's Fallback User Repository
a request can be opened in the issues section
of the public Fallback User repository
Github mirror at the link reported below using
the tag '[Package request]'.


Options
=======

-w repo-dir

  Directory containing the fur tree.
  To be set when download only is true,
  otherwise is temporary.


-K sig-dir

  Signatures directory.


-d

  Download only (noinstall).


-o output-dir

  Output directory for the packages.


-D y\/n

  Whether to skip dependencies check.


-R y\/n

  Resolve missing dependencies.


-T

  Clean cache at the end
  of the operation.


Platform options
=================

-p package_manager

  Package manager.
  It can have any compatible
  value. Tested with:

  - inteppacman

    Default Ur package manager,
    extra to pacman has support
    for managing native Android
    applications packages same
    as pacman packages.
    For more information on how
    to package native Android
    applications on the Ur,
    consult Ur documentation.

  - pacman

    Default fallback
    package manager.


-P platform

  DogeOS base platform for which
  to retrieve packages,
  can be:

  - android

  - gnu

  - windows.

  For more informations about
  base platforms consult
  DogeOS documentation.


-A architecture

  Architecture for which
  to retrieve packages.
  It can be

  - aarch64

    For packages including
    ARM64 (ARMv8) processors
    compatible binaries.

  - any

    For packages which do not
    include any architecture-specific
    binary.

  - arm

    Normally this architecture code is used
    to refer to ARMv5 architecture but Termux
    environment on ARMv7 processors refer to
    themselves as such.

  - x86_64

    The architecture used on most personal
    computers.

  For more informations about
  adding support for a new
  architecture consult
  Reallymakepkg documentation.


Mirror options
=================

-l repo-name

  Repository name of the mirror.
  Default value is 'fur'.


-n namespace

  Repository namespace for the mirror.
  Default value is 'themartiancompany'.


-m mirror

  Fur mirror.
  It can be:

  - github

  - gitlab


-t mirror-type

  It can be:

  - tree

    A git repository branch
    named same as the package
    with a certain directory
    structure.

  - ci

    Downloads package files
    from Github or Gitlab
    Ur mirrors using the 'gur'
    program.


-L git-protocol

  Which protocol to use when
  obtaining files with Git.
  Relevant when mirror type is
  set to 'tree'.
  It can be

  - http

  - ssh


Application options
=====================

-h

  Display help.

-c

  Enable color output

-v

  Enable verbose output


Bugs
====

https://github.com/themartiancompany/fur/-/issues


Copyright
=========

Copyright Pellegrino Prevete. AGPL-3.0.


See also
========

* ur
* gur
* lur


.. include:: variables.rst
