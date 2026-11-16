# yagni/linux

```
    ___
   (-- |
   (<> |
  / __  \
 ( /  \ /|
_/\ __)/_)
\/-____\/
```

a small x86-64 uefi linux distribution, built on [musl libc](https://musl.libc.org) and [busybox](https://busybox.net).
100% [gnu](https://www.gnu.org) free, everything static.

- 14MB base, 7MB download, <12MB ram idle
- jits, a <180 line package manager
- luwm, a <180 line window manager on swc
- package something in a few minutes

it has only ever booted in [qemu](https://www.qemu.org).

website, install guide and manual: https://yagnilinux.github.io


## layout

```
pkgs/        one directory per package
mkrepo       builds pkgs/ into repo/
mkrootfs     builds yagni.tar.gz out of repo/
mksrc        collects the source of everything in repo/
```

```sh
./mkrepo
./mkrootfs
```

source for every shipped package is on the `sources` branch.


## license

cddl 1.1, see LICENSE. the software it packages keeps its own license.
the penguin is kiss linux's (mit), with less enthusiasm.
