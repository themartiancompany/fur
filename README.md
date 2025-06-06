# Fur

The fur, acronym for "Fallback User Repository",
is an helper program for the uncensorable, unstoppable
[Ur](
  https://github.com/themartiancompany/ur)
user repository and application store which
retrieves and installs binary packages from
censorable sources, like Github.

Of course the name 'fur' carries other meanings
as well, given the Ur is the DogeOS application store.

I suppose nobody should explain how a fur relates
to a Doge, no?

## Repository structure

Each branch on this repository represents a software
package. Packages are currently provided for the desktop
and mobile Life and DogeOS bases.

If you want a binary package for a new software to
be added to this specific instance of the fur,
feel free to open a request in the issues section.

## Installation

To install and run the program using the ur just run

```bash
ur \
  fur    
```

to install it with make instead run

```bash
make \
  install
```

You can also just run the program using bash,
so if you cloned it in your home directory run

```bash
bash \
  ~/fur/fur/fur
```

add the `-h` option to return the help.

Further informations are available
in the manual, which can be accessed
with

```bash
man \
  fur
```

and in the
[docs](
  docs)
directory.

## License

This program is released under the terms of the
Gnu Affero General Public License version 3
by dvorak from The Martian Company.
