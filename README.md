# sidewinder/linux

```
    ___
   (-- |
   (<> |
  / __  \
 ( /  \ /|
_/\ __)/_)
\/-____\/
```

a statically linked x86-64 linux distribution using [musl libc](https://musl.libc.org) and [busybox](https://busybox.net).
no dynamic loader, no /lib, no /sbin. 1000% [gnu](https://www.gnu.org) free.

- 14MB base, 7MB download, <12MB ram idle
- a 37MB iso that installs with no internet
- openbsd's doas and ksh, freebsd's bc, netbsd's curses, apple's lzfse
- cook, a <180 line package manager
- deadeye, a <180 line wayland compositor on swc
- package something in a few minutes

it has only ever booted in [qemu](https://www.qemu.org).

website, install guide and manual: https://sidewinder-linux.codeberg.page


## layout

```
pkgs/        one directory per package
superlab     builds pkgs/ into repo/
mkrootfs     builds sidewinder.tar.gz out of repo/
mkiso        builds sidewinder.iso: the kernel is BOOTX64.EFI, the live system is inside it
iso/         the live system's inittab, motd and boot script
mksrc        collects the source of everything in repo/
```

```sh
./superlab
./mkrootfs
./mkiso      # as root
```

source for every shipped package is on the `sources` branch.


## license

cddl 1.1, see LICENSE. the software it packages keeps its own license.
the penguin is kiss linux's (mit), with less enthusiasm.
