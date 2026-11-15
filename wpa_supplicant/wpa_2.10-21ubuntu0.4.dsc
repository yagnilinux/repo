-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: wpa
Binary: hostapd, wpagui, wpasupplicant, wpasupplicant-udeb, eapoltest, libwpa-client-dev
Architecture: linux-any kfreebsd-any
Version: 2:2.10-21ubuntu0.4
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders:  Andrej Shadura <andrewsh@debian.org>
Homepage: https://w1.fi/wpa_supplicant/
Standards-Version: 4.4.1
Vcs-Browser: https://salsa.debian.org/debian/wpa
Vcs-Git: https://salsa.debian.org/debian/wpa.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper-compat (= 13), libdbus-1-dev, libssl-dev, qtbase5-dev [linux-any] <!pkg.wpa.nogui>, libncurses5-dev, libpcsclite-dev, libnl-3-dev [linux-any], libnl-genl-3-dev [linux-any], libnl-route-3-dev [linux-any], libpcap-dev [kfreebsd-any], libbsd-dev [kfreebsd-any], libreadline-dev, pkgconf | pkg-config, docbook-to-man <!nodoc>, docbook-utils <!nodoc>
Package-List:
 eapoltest deb net optional arch=linux-any,kfreebsd-any
 hostapd deb net optional arch=linux-any,kfreebsd-any
 libwpa-client-dev deb libdevel optional arch=linux-any,kfreebsd-any
 wpagui deb net optional arch=linux-any profile=!pkg.wpa.nogui
 wpasupplicant deb net optional arch=linux-any,kfreebsd-any
 wpasupplicant-udeb udeb debian-installer standard arch=linux-any profile=!noudeb
Checksums-Sha1:
 5995b205af351c4f39fd136fbfef5bb2264c3a5d 2549336 wpa_2.10.orig.tar.xz
 d49f6a37609b63b115976ffd77910f9df871b749 93956 wpa_2.10-21ubuntu0.4.debian.tar.xz
Checksums-Sha256:
 b39f85be9d8fd58adee1acae3735ec0a1f7bdc460fe3f6fd76a1d57e9ac910c6 2549336 wpa_2.10.orig.tar.xz
 b21bfb61d2b1650f2533a90faba132c3de255531873db26ff721327d0beae2c3 93956 wpa_2.10-21ubuntu0.4.debian.tar.xz
Files:
 65a019b87548bbe385635f93cfa9cddb 2549336 wpa_2.10.orig.tar.xz
 d17821883572d98596a002f718e019c4 93956 wpa_2.10-21ubuntu0.4.debian.tar.xz
Original-Maintainer: Debian wpasupplicant Maintainers <wpa@packages.debian.org>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEztYvF7tyekj8UHYuKhWJh3BXRUEFAmmF+psACgkQKhWJh3BX
RUHX8Q/9FD3gjlAbo947KsDyee3xEYng8WHmVoqFlBHC2GXV/jFX3F2xs5fmOziZ
qbfpH13VQ3pNsPRRl5Ljvx7KUNpKpVxnGQ3ttf/L+V2ptcAA3fNGtk4c63KiiMDO
Uk4ixrOGlSQovIiRuJW0IEPQrEPiDJ136jk7EkzyjH0nMDKNT3JQJ/wBja/58UU2
rfPC/d1LDs62C/ZnhTZWiDjEOWSFSO9c1QGfjQXn9bU0nc3EMlegu1Ij7gr85rTr
kHmyHzGaBWZeUIn8FrkdAlNwrohAXG3OVJC1Kl0M2NuizVoF5GYIUWvhDr9a3xBH
6uOAXWAQryqBeF5u28b7+enPQK9YRhbVBJLJQF5DmwgcjxCzoa30BBDiaU1zs/72
F2ZPuOAbKb2YXOovC7r7KH1XG5z/pxMPBB/uInmI+FhXnX3UX4muk2aYRP/NT+Ux
zh4XVJ7sEslRGIgNdXBG/LrRs4qpCDMgxDqVj87gmfYCGNPHd+VgAMb9dOvx45mj
OWRgfan7lnOrHnOT+cwMAVWFbsNx2I0A/TTq1NSM1AWFWJ1SXnUF88/ST8xervah
6aEYZn0j6xpH4+HSxgC1zxu34kzBAhuJcIu9Fpc4aAkhH3UaXz7iUu5tqo96PL5d
yHO4rYjIWckg3RxK2BNusvPKc2duApZREIyj5KHUwsFM3r4FhaU=
=BV9q
-----END PGP SIGNATURE-----
