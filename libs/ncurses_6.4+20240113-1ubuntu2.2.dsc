-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: ncurses
Binary: ncurses-base, ncurses-term, libtinfo6, libtinfo6-udeb, libncurses6, libncurses-dev, libncursesw6, libncursesw6-udeb, lib64tinfo6, lib64ncurses6, lib64ncursesw6, lib64ncurses-dev, lib32tinfo6, lib32ncurses6, lib32ncursesw6, lib32ncurses-dev, ncurses-bin, ncurses-examples, ncurses-doc
Architecture: any all
Version: 6.4+20240113-1ubuntu2.2
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sven Joachim <svenjoac@gmx.de>, Craig Small <csmall@debian.org>
Homepage: https://invisible-island.net/ncurses/
Standards-Version: 4.6.2
Vcs-Browser: https://salsa.debian.org/debian/ncurses
Vcs-Git: https://salsa.debian.org/debian/ncurses.git
Testsuite: autopkgtest
Build-Depends: debhelper-compat (= 13), libgpm-dev [linux-any], pkgconf, autoconf-dickey (>= 2.52+20210509)
Build-Depends-Arch: g++-multilib [amd64 i386 powerpc ppc64 s390 sparc] <!nobiarch>
Package-List:
 lib32ncurses-dev deb libdevel optional arch=amd64,ppc64 profile=!nobiarch
 lib32ncurses6 deb libs optional arch=amd64,ppc64 profile=!nobiarch
 lib32ncursesw6 deb libs optional arch=amd64,ppc64 profile=!nobiarch
 lib32tinfo6 deb libs optional arch=amd64,ppc64 profile=!nobiarch
 lib64ncurses-dev deb libdevel optional arch=i386,powerpc,sparc,s390 profile=!nobiarch
 lib64ncurses6 deb libs optional arch=i386,powerpc,sparc,s390 profile=!nobiarch
 lib64ncursesw6 deb libs optional arch=i386,powerpc,sparc,s390 profile=!nobiarch
 lib64tinfo6 deb libs optional arch=i386,powerpc,sparc,s390 profile=!nobiarch
 libncurses-dev deb libdevel optional arch=any
 libncurses6 deb libs optional arch=any
 libncursesw6 deb libs optional arch=any
 libncursesw6-udeb udeb debian-installer optional arch=any profile=!noudeb
 libtinfo6 deb libs optional arch=any
 libtinfo6-udeb udeb debian-installer optional arch=any profile=!noudeb
 ncurses-base deb misc required arch=all essential=yes
 ncurses-bin deb utils required arch=any essential=yes
 ncurses-doc deb doc optional arch=all
 ncurses-examples deb misc optional arch=any profile=!pkg.ncurses.noexamples
 ncurses-term deb misc standard arch=all
Checksums-Sha1:
 f68717e15ac773b6bf2370c22d2dca6f7344d333 3688489 ncurses_6.4+20240113.orig.tar.gz
 10de8ab4e14ab72531cd34736fce77b59efe688a 729 ncurses_6.4+20240113.orig.tar.gz.asc
 d4b5747fae460f4abecb4e2c8b3937a9337cae86 50532 ncurses_6.4+20240113-1ubuntu2.2.debian.tar.xz
Checksums-Sha256:
 37a12a0f8ae2605012c9a164dd286b0cfa02b51b5055836d09eb3d597fc351b1 3688489 ncurses_6.4+20240113.orig.tar.gz
 b70cfa4f155f61dfa7c085ad1e3f90c73132ad198764d7793a44cd7fdca51f1b 729 ncurses_6.4+20240113.orig.tar.gz.asc
 c7bbb8483d7ec358fb925a370575d8ebef63d6e455edce140de2ca7b86cf98d1 50532 ncurses_6.4+20240113-1ubuntu2.2.debian.tar.xz
Files:
 e4413199eea72d2cd4e252e9bf9e88b6 3688489 ncurses_6.4+20240113.orig.tar.gz
 19ebd3dca63568f3419507fb505c763c 729 ncurses_6.4+20240113.orig.tar.gz.asc
 83a84315587611c76bb03ee4a1f96adf 50532 ncurses_6.4+20240113-1ubuntu2.2.debian.tar.xz
Original-Maintainer: Ncurses Maintainers <ncurses@packages.debian.org>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEyMDHOTG0YH5UsajI8pSCVQZYHygFAmqVaXMACgkQ8pSCVQZY
HyguGQ//TtLxoZHIy6PFX+rJJ72NlNgxqh7dm2YGcGgC7vAA7oWJVTi0QV2KW4j4
WlQXkfBTx6B3LttJN8bynWB3UmRlezrEYJGlSx6muXL6CqjLPqi5/8+R3KZEyO+m
x//QaGoRU/nSu/0gqjhBaQfw73Ru5Q98ZSA/sRPo5c7QMEVW9VNIgMn03+rmRkiL
3Hh5bbwwPCZdK5K+uxcohr4h/J3DA8oAJNVbGiwZpctPgVPXXHgMSA7yNKhNlbnY
/7wObDjPqB53hV9nY33rVWUCryuh+pYUgzXXMoTuihUBpOf1h/Tz9MxDs5Tb74is
/ejakK5/0QcauEDx2EukjpjO2jegjXahVCcNjUXPbcHElVpgT5Cs85/byXe+0DYZ
2tK52wSwtMQvU07YB9NqhKAeKkpKnxHYBnhJzkEGuwSdhYBZIds2fzpJUqBiTkAe
snJxKucsum0HWN6vx3zBjms3EeZgssX9XeOG/v1Eycu001MjoGE5Mw8O0TuMssZY
YhfyCEc438auBjlK4HuyVB6c+plJDvfzngEk7ryqQCoGAmP7N4yOXdXcJMgcDMYf
YnLRcF156/Yo/Lv5aAkgIZPWWBS4HMogH0kK900Kl2ISp9vnBrapKd1P1W/r8wTI
b1WLUl8VFhwC4EM3UF5Sh8atBOvegao/4RTNIuH/R2fMqsPRSTs=
=sovA
-----END PGP SIGNATURE-----
