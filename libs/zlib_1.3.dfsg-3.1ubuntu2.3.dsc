-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: zlib
Binary: zlib1g, zlib1g-dev, zlib1g-udeb, lib64z1, lib64z1-dev, lib32z1, lib32z1-dev, libn32z1, libn32z1-dev, libx32z1, libx32z1-dev, minizip, libminizip1t64, libminizip-dev
Architecture: any
Version: 1:1.3.dfsg-3.1ubuntu2.3
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Homepage: http://zlib.net/
Standards-Version: 4.6.1
Build-Depends: dpkg-dev (>= 1.22.5), debhelper (>= 13), gcc-multilib [amd64 i386 kfreebsd-amd64 mips mipsel powerpc ppc64 s390 sparc s390x mipsn32 mipsn32el mipsr6 mipsr6el mipsn32r6 mipsn32r6el mips64 mips64el mips64r6 mips64r6el x32] <!nobiarch>, autoconf
Package-List:
 lib32z1 deb libs optional arch=amd64,ppc64,kfreebsd-amd64,s390x profile=!nobiarch
 lib32z1-dev deb libdevel optional arch=amd64,ppc64,kfreebsd-amd64,s390x profile=!nobiarch
 lib64z1 deb libs optional arch=sparc,s390,i386,powerpc,mips,mipsel,mipsn32,mipsn32el,mipsr6,mipsr6el,mipsn32r6,mipsn32r6el,x32 profile=!nobiarch
 lib64z1-dev deb libdevel optional arch=sparc,s390,i386,powerpc,mips,mipsel,mipsn32,mipsn32el,mipsr6,mipsr6el,mipsn32r6,mipsn32r6el,x32 profile=!nobiarch
 libminizip-dev deb libdevel optional arch=any
 libminizip1t64 deb libs optional arch=any
 libn32z1 deb libs optional arch=mips,mipsel profile=!nobiarch
 libn32z1-dev deb libdevel optional arch=mips,mipsel profile=!nobiarch
 libx32z1 deb libs optional arch=amd64,i386
 libx32z1-dev deb libdevel optional arch=amd64,i386
 minizip deb utils optional arch=any
 zlib1g deb libs required arch=any
 zlib1g-dev deb libdevel optional arch=any
 zlib1g-udeb udeb debian-installer optional arch=any
Checksums-Sha1:
 1013da3e3125946039f2c60e291a54a9422b4553 1128572 zlib_1.3.dfsg.orig.tar.xz
 7c44e97922cd67a13c17d586168cf6674513ee34 61772 zlib_1.3.dfsg-3.1ubuntu2.3.debian.tar.xz
Checksums-Sha256:
 5eea0322c1c21c75cad3b607ac1c43ff5c71e014b8ac4a34300b5e2b80d02e70 1128572 zlib_1.3.dfsg.orig.tar.xz
 ada8a0c4a1016eb8cd549f4689fd9f73b04d9c55163a318cabdfb0c3872cfe1c 61772 zlib_1.3.dfsg-3.1ubuntu2.3.debian.tar.xz
Files:
 3eee75fc36a344cfe93c8bf1c0473df4 1128572 zlib_1.3.dfsg.orig.tar.xz
 3bd5821736b4fa9c1a89d64ce818a8ab 61772 zlib_1.3.dfsg-3.1ubuntu2.3.debian.tar.xz
Original-Maintainer: Mark Brown <broonie@debian.org>

-----BEGIN PGP SIGNATURE-----

iQJUBAEBCgA+FiEEX6QyiBCwMhrhrX3Dv6T2hRCB8x0FAmrZMSggHHNoYWZheWF0
Lm1hanVtZGVyQGNhbm9uaWNhbC5jb20ACgkQv6T2hRCB8x0iNA//d3hQNnquJOLn
ysxUPtXH3lIm/2nVI//K2AADEmKj3G8zrpl2+iVL7jd1R+cFKS3fN/56b3bHoMQW
inQsDKfYY4QoPxiNt+NKtl2N4GFnjt/9YwN+tC07w/qkNQchre30B9gXna8VhlM9
4lWbKsDL+0zSn9orG+Bi3wAEqK+O6d5OSE0bOEXH2bplVxGyHyMUFlaHFUo4R3qH
36h1Q8nNr3sHClX766oeY9blc0pV8fH7YFT43pcd63Ua8VBocW7YTvExzgPa3oCj
smxoQbEiDy6j1nXwiyrKzl8CuDfFU0ow/wT7tIR+KIrf1JYXuVGc6fXy5nX3kX/I
5QLj7W759ZdD5JvhoCoJhLJhRVq8liUTy4UX8eioIcKIDBKWWjKUihV0m6sPyYXb
MMlzXszMUajYE2v5Lz48JtyaCEatcdd93RxAL7cSX9TKOIEKcQgGApRdK98dTP6E
dv4b0sS3WOlquJqGYUpax6xUka5Ch9f2WYGhTRmXGdUDzmrtzLP8/f57I7MbCs0x
G1H59d7mmZPxGirlMZwPmlTf1ZM+IFAGPQvSvrDUFlLU58i8hqM7bZC0xAPhbDLF
RNjYxUHdpZP/J/UbHo6LtNiRCUGf5Ufi4lejMmznYfQBSGRVQYJuWHsRItD0K9OO
/2G7E0DiOVn0U4MGM/IQ7vYbjU/8cxA=
=p8zJ
-----END PGP SIGNATURE-----
