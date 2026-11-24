# blackout

lights out.

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

- rag, the package manager. it builds a bottle from source when your mix asks for
  different fuel, and uses the prebuilt package when it doesn't
- skarnet's s6 and s6-linux-init as init, so services come back when they die
- openbsd's doas, ksh and mandoc, freebsd's bc, netbsd's curses, apple's lzfse
- samurai, muon and pdpmake instead of ninja, meson and gnu make
- barricade, a wayland compositor on swc
- apps are one folder each in ~/apps

it has only ever booted in [qemu](https://www.qemu.org).

website, install guide and manual: https://yagnilinux.github.io


## layout

```
crate/     the bottles, one directory each, in categories: crate/browsers/netsurf
mkrepo       builds crate/ into repo/
mkpkg        builds just the packages you name: ./mkpkg scrawl
mkrootfs     builds blackout.tar.gz out of repo/
mkiso        builds blackout.iso: the kernel is BOOTX64.EFI, the live system is inside it
cc/          musl-cc: clang against our own musl. cc/gcc is a stub that fails the build
iso/         the live system's shells, motd and disc finder
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
