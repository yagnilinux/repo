/* png <-> ppm */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <zlib.h>

static void die(const char *s) { fprintf(stderr, "png: %s\n", s); exit(1); }
static unsigned be(const unsigned char *p) { return (unsigned)p[0] << 24 | p[1] << 16 | p[2] << 8 | p[3]; }
static void put32(unsigned v, FILE *f) { putc(v >> 24, f), putc(v >> 16, f), putc(v >> 8, f), putc(v, f); }
static void *grow(void *p, size_t n) { if (!(p = realloc(p, n))) die("out of memory"); return p; }
static int paeth(int a, int b, int c) {
	int p = a + b - c, pa = abs(p - a), pb = abs(p - b), pc = abs(p - c);
	return pa <= pb && pa <= pc ? a : pb <= pc ? b : c;
}

/* png to ppm */
static void dec(void) {
	unsigned char h[8], *z = 0, *raw, *img, pal[768] = {0};
	unsigned w = 0, ht = 0, dep = 0, ct = 0, len, nz = 0;
	if (fread(h, 1, 8, stdin) != 8 || memcmp(h, "\x89PNG\r\n\x1a\n", 8)) die("not a png");
	for (;;) {
		if (fread(h, 1, 8, stdin) != 8) die("truncated");
		len = be(h);
		unsigned char *d = grow(0, len + 4);
		if (fread(d, 1, len + 4, stdin) != len + 4) die("truncated");
		if (!memcmp(h + 4, "IHDR", 4)) {
			w = be(d), ht = be(d + 4), dep = d[8], ct = d[9];
			if (d[12]) die("interlaced");
		} else if (!memcmp(h + 4, "PLTE", 4)) memcpy(pal, d, len < 768 ? len : 768);
		else if (!memcmp(h + 4, "IDAT", 4)) z = grow(z, nz + len), memcpy(z + nz, d, len), nz += len;
		else if (!memcmp(h + 4, "IEND", 4)) { free(d); break; }
		free(d);
	}
	static const int ch[] = {1, 0, 3, 1, 2, 0, 4};
	if (!w || !ht || w > 16384 || ht > 16384 || ct > 6 || !ch[ct]) die("bad header");
	size_t bpp = (ch[ct] * dep + 7) / 8, st = ((size_t)w * ch[ct] * dep + 7) / 8;
	uLongf n = (st + 1) * ht;
	raw = grow(0, n), img = grow(0, st * ht);
	if (uncompress(raw, &n, z, nz) != Z_OK || n != (st + 1) * ht) die("bad data");
	/* undo filters */
	for (size_t y = 0; y < ht; y++) {
		unsigned char *r = raw + y * (st + 1), *o = img + y * st, *u = y ? o - st : 0;
		for (size_t x = 0; x < st; x++) {
			int a = x >= bpp ? o[x - bpp] : 0, b = u ? u[x] : 0, c = u && x >= bpp ? u[x - bpp] : 0;
			int f[] = {0, a, b, (a + b) / 2, paeth(a, b, c)};
			if (r[0] > 4) die("bad filter");
			o[x] = r[x + 1] + f[r[0]];
		}
	}
	printf("P6\n%u %u\n255\n", w, ht);
	for (size_t y = 0; y < ht; y++)
		for (size_t x = 0; x < w; x++) {
			unsigned char *p = img + y * st, rgb[3];
			unsigned v, s = dep == 16 ? 2 : 1;
			if (dep < 8) v = p[x * dep / 8] >> (8 - dep - x * dep % 8) & ((1 << dep) - 1);
			else v = p[x * ch[ct] * s];
			if (ct == 3) memcpy(rgb, pal + 3 * v, 3);
			else if (ct == 0 || ct == 4) rgb[0] = rgb[1] = rgb[2] = dep < 8 ? v * 255 / ((1 << dep) - 1) : v;
			else for (int i = 0; i < 3; i++) rgb[i] = p[(x * ch[ct] + i) * s];
			fwrite(rgb, 1, 3, stdout);
		}
}

static void chunk(const char *t, const unsigned char *d, unsigned n) {
	unsigned c = crc32(crc32(0, (const unsigned char *)t, 4), d, n);
	put32(n, stdout), fwrite(t, 1, 4, stdout), fwrite(d, 1, n, stdout), put32(c, stdout);
}

/* ppm to png */
static void enc(void) {
	unsigned w, h, m;
	if (scanf("P6 %u %u %u", &w, &h, &m) != 3 || getchar() == EOF || m != 255 || !w || !h || w > 16384 || h > 16384)
		die("not a P6 ppm");
	size_t st = (size_t)w * 3, n = (st + 1) * h;
	unsigned char *raw = grow(0, n), *img = grow(0, st * h), hd[13];
	if (fread(img, st, h, stdin) != h) die("truncated");
	/* sub filter */
	for (size_t y = 0; y < h; y++) {
		unsigned char *r = raw + y * (st + 1), *p = img + y * st;
		r[0] = 1;
		for (size_t x = 0; x < st; x++) r[x + 1] = p[x] - (x >= 3 ? p[x - 3] : 0);
	}
	uLongf zn = compressBound(n);
	unsigned char *z = grow(0, zn);
	if (compress2(z, &zn, raw, n, 9) != Z_OK) die("deflate failed");
	fwrite("\x89PNG\r\n\x1a\n", 1, 8, stdout);
	memcpy(hd, (unsigned char[]){w >> 24, w >> 16, w >> 8, w, h >> 24, h >> 16, h >> 8, h, 8, 2, 0, 0, 0}, 13);
	chunk("IHDR", hd, 13), chunk("IDAT", z, zn), chunk("IEND", 0, 0);
}

int main(int argc, char **argv) {
	if (argc != 2 || (strcmp(argv[1], "-d") && strcmp(argv[1], "-e")))
		die("usage: png -d|-e < in > out");
	argv[1][1] == 'd' ? dec() : enc();
	return fflush(stdout) ? 1 : 0;
}
