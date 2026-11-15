-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: musl
Binary: musl, musl-dev, musl-tools
Architecture: arm64 musl-linux-arm64 armel armhf musl-linux-armhf i386 musl-linux-i386 amd64 musl-linux-amd64 m68k musl-linux-m68k mips musl-linux-mips mipsel musl-linux-mipsel mips64el musl-linux-mips64el s390x musl-linux-s390x sh4 musl-linux-sh4 ppc64el musl-linux-ppc64el riscv64 musl-linux-riscv64
Version: 1.2.4-2
Maintainer: Reiner Herrmann <reiner@reiner-h.de>
Homepage: https://musl.libc.org/
Standards-Version: 4.6.2
Vcs-Browser: https://salsa.debian.org/reiner/musl
Vcs-Git: https://salsa.debian.org/reiner/musl.git
Testsuite: autopkgtest
Testsuite-Triggers: binutils, build-essential, file
Build-Depends: debhelper-compat (= 13), gcc-aarch64-linux-gnu [arm64], gcc-arm-linux-gnueabi [armel], gcc-arm-linux-gnueabihf [armhf], gcc-i686-linux-gnu [i386], gcc-m68k-linux-gnu [m68k], gcc-mips-linux-gnu [mips], gcc-mips64el-linux-gnuabi64 [mips64el], gcc-mipsel-linux-gnu [mipsel], gcc-powerpc64le-linux-gnu [ppc64el], gcc-riscv64-linux-gnu [riscv64], gcc-s390x-linux-gnu [s390x], gcc-sh4-linux-gnu [sh4], gcc-x86-64-linux-gnu [amd64]
Package-List:
 musl deb libs optional arch=arm64,musl-linux-arm64,armel,armhf,musl-linux-armhf,i386,musl-linux-i386,amd64,musl-linux-amd64,m68k,musl-linux-m68k,mips,musl-linux-mips,mipsel,musl-linux-mipsel,mips64el,musl-linux-mips64el,s390x,musl-linux-s390x,sh4,musl-linux-sh4,ppc64el,musl-linux-ppc64el,riscv64,musl-linux-riscv64
 musl-dev deb libdevel optional arch=arm64,musl-linux-arm64,armel,armhf,musl-linux-armhf,i386,musl-linux-i386,amd64,musl-linux-amd64,m68k,musl-linux-m68k,mips,musl-linux-mips,mipsel,musl-linux-mipsel,mips64el,musl-linux-mips64el,s390x,musl-linux-s390x,sh4,musl-linux-sh4,ppc64el,musl-linux-ppc64el,riscv64,musl-linux-riscv64
 musl-tools deb devel optional arch=amd64,arm64,armel,armhf,i386,m68k,mips,mips64el,mipsel,ppc64el,riscv64,s390x,sh4
Checksums-Sha1:
 78eb982244b857dbacb2ead25cc0f631ce44204d 1063758 musl_1.2.4.orig.tar.gz
 b0e6539e3bcda9312c9bc98ef8b6f8a1aa080617 490 musl_1.2.4.orig.tar.gz.asc
 60ff224bee23e275a7888a5b39f08de13e8a4165 24152 musl_1.2.4-2.debian.tar.xz
Checksums-Sha256:
 7a35eae33d5372a7c0da1188de798726f68825513b7ae3ebe97aaaa52114f039 1063758 musl_1.2.4.orig.tar.gz
 4aa4f74cdabd0629d9400c04637ccc311dd120baa137c016e25dfdcb5600a4ad 490 musl_1.2.4.orig.tar.gz.asc
 953f9b71d1c1fd827a521725ead722fd3821ac208614cf99f8150dec070b1121 24152 musl_1.2.4-2.debian.tar.xz
Files:
 ba95cb2c0ba278f081f96380be555fce 1063758 musl_1.2.4.orig.tar.gz
 e2fcfbf5e8de162b76ce70507342546f 490 musl_1.2.4.orig.tar.gz.asc
 c8cea0a06747492396986922c5d2f009 24152 musl_1.2.4-2.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE2Pb6feok2Q1urHM7zPBJKNsO6qcFAmVOhY8ACgkQzPBJKNsO
6qecuhAA3WnHCAFKz2I9VqBaUycCNehDfGpf7EIDirNQcCoa9izsMBAE7TAkeZkx
7WT6WAC+bOClyN0XX1jzOBX4cKC8IGGD9vNxvCVvRI/9tcoYio1YyNJ+7SHlyRLI
ZwuFnLrolV6PVzrBDvo1ldvgJkxl9bsMfWLxVctpZjd0pYnFVk7DSBREApvihDjL
1pUvLrnHSZyUofvQe+TBp6rVRo63ny1BfWRi2aryCdjdM4jruw+2DpY9AggwytCn
QPY0dFWhTg6qa3PnyUML2pzMU3T/jUiHxVcbNZXXwWT051m4rM3nAik0iGMMlMdd
rn+D31PvFTE8L6fHlLUvGQMnEx7TaHbtf1z867rVAjUW4GFCUM99W9quZiqw3EAE
fuiXQrDHfHgtCy5JAaUblfHw3wrrp48mn648V7w2C1WZzaaNRZvIFFFRlueExs5S
tUJ1axDuwpVghX/l2Gy1chIPCds7gMIptSbDJkRzvR5k5ViSwwSIipTO8B/UAQla
djNNMUN+91xxKjq93Q27xyh+Uzmk7kJSF9MSC5d6aAk+NHpYN8G2fwMRRn5/CB0p
P4munqUtCgLJr4n8zaY2FlXP9Unj/3qm5aV5SMFfWGvUZTHx5LUIRGsqyr/hKtMH
+9oYMjfKZtF0gcTNk4rPf3cuHmRYG1dSOqIBhK9Gnc5ipEMXhDo=
=qafd
-----END PGP SIGNATURE-----
