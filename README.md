# requiem

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
no dynamic loader, no /lib, no /sbin. 100% [gnu](https://www.gnu.org) free: everything is built
with clang, lld and compiler-rt, so not even libgcc ends up in a binary.

- an iso that installs with no internet
- openbsd's doas and ksh, freebsd's bc, netbsd's curses, apple's lzfse
- introit, the package manager
- kyrie, a wayland compositor on swc
- apps are one folder each in ~/apps, like macos
- package something in a few minutes

it has only ever booted in [qemu](https://www.qemu.org).

website, install guide and manual: https://requiem-linux.codeberg.page


## layout

```
pkgs/        one directory per package
mkrepo       builds pkgs/ into repo/
mkpkg        builds just the packages you name: ./mkpkg htop
mkrootfs     builds requiem.tar.gz out of repo/
mkiso        builds requiem.iso: the kernel is BOOTX64.EFI, the live system is inside it
cc/          musl-cc: clang against our own musl. cc/gcc is a stub that fails the build
iso/         the live system's inittab, motd and boot script
mksrc        collects the source of everything in repo/
```

```sh
./mkrepo
./mkrootfs
./mkiso      # as root
```

source for every shipped package is on the `sources` branch.


## license

cddl 1.1, see LICENSE. the software it packages keeps its own license.
the penguin is kiss linux's (mit), with less enthusiasm.
