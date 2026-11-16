/* luwm: tiny swc wm */
#define _POSIX_C_SOURCE 200809L
#include <signal.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <linux/input-event-codes.h>
#include <wayland-server.h>
#include <xkbcommon/xkbcommon.h>
#include <swc.h>
#include "window.h"     /* swc internals */
#include "compositor.h" /* for restacking */

typedef union { const char *s; int i; } A;
typedef struct { unsigned m, k; void (*f)(A); A a; } K;
typedef struct { struct swc_screen *s; int ws; } S;
typedef struct { struct swc_window *w; S *s; int ws, fs; struct swc_rectangle g; } C;
static void run(A), end(A), quit(A), show(A), mv(A), cyc(A), fs(A);
/* config */
#define MOD SWC_MOD_LOGO
#define SH SWC_MOD_SHIFT
static unsigned BW = 3, BF = 0x3d6fa3, BU = 0x253e5b; /* LUWM_* overrides */
#define W(k, n) {MOD, k, show, {.i = n}}, {MOD | SH, k, mv, {.i = n}}
static const K keys[] = {
	{MOD, XKB_KEY_Return, run, {.s = "eval exec ${TERMINAL:-havoc}"}},
	{MOD, XKB_KEY_d,      run, {.s = "eval exec ${MENU:-dmenu_run}"}},
	{MOD, XKB_KEY_q,      end, {0}},       /* close */
	{MOD | SH, XKB_KEY_q, quit, {0}},      /* exit */
	{MOD, XKB_KEY_Tab,    cyc, {.i = 1}},  /* bottom up */
	{MOD, XKB_KEY_grave,  cyc, {.i = -1}}, /* top down */
	{MOD, XKB_KEY_f,      fs,  {0}},       /* fullscreen */
	W(XKB_KEY_1, 0), W(XKB_KEY_2, 1), W(XKB_KEY_3, 2), W(XKB_KEY_4, 3),
};
#define N(a) (int)(sizeof a / sizeof *a)
#define KS "abcdefghijklmnopqrstuvwxyz0123456789"
#define IN(c) ((struct window *)(c)->w)
#define L(c) (IN(c)->view->link)
static struct wl_display *dpy;
static S *scr;
static C **cl, *fc, *hv, *dc; /* bottom first, grows */
static int n, cap;

static int vis(C *c) { return c->ws == c->s->ws; }
static int at(C *c) { for (int i = 0; i < n; i++) if (cl[i] == c) return i; return -1; }
static void focus(C *c) {
	if (fc) swc_window_set_border(fc->w, BU, fc->fs ? 0 : BW);
	if (c) swc_window_set_border(c->w, BF, c->fs ? 0 : BW);
	swc_window_focus(c ? c->w : 0);
	fc = c;
}
static C *top(void) {
	for (int i = n; i--;) if (cl[i]->s == scr && vis(cl[i])) return cl[i];
	return 0;
}
/* restack: top or bottom */
static void put(C *c, int up) {
	int i = at(c);
	memmove(cl + i, cl + i + 1, (--n - i) * sizeof *cl);
	C *o = n ? cl[up ? n - 1 : 0] : 0;
	if (up) cl[n++] = c;
	else memmove(cl + 1, cl, n++ * sizeof *cl), cl[0] = c;
	if (!o) return;
	wl_list_remove(&L(c));
	wl_list_insert(up ? L(o).prev : &L(o), &L(c));
	if (vis(c)) swc_window_hide(c->w), swc_window_show(c->w); /* repaint */
}
/* window under pointer */
static C *under(void) {
	int x, y;
	swc_pointer_position(&x, &y);
	for (int i = n; i--;) {
		struct swc_rectangle *g = &IN(cl[i])->view->base.geometry;
		if (cl[i]->s == scr && vis(cl[i]) && x >= g->x && y >= g->y &&
		    x < g->x + (int)g->width && y < g->y + (int)g->height) return cl[i];
	}
	return 0;
}
static void back(C *c) { if (c) put(c, 0), focus(hv = top()); } /* keep flipping */

static unsigned ev(const char *v, unsigned d, int b) { const char *s = getenv(v); return s && *s ? strtoul(s + (*s == '#'), 0, b) : d; }
static void run(A a) { if (!fork()) setsid(), execl("/bin/sh", "sh", "-c", a.s, (char *)0), _exit(1); }
static void end(A a) { if (fc) swc_window_close(fc->w); }
static void quit(A a) { wl_display_terminate(dpy); }
static void show(A a) {
	scr->ws = a.i;
	for (int i = 0; i < n; i++)
		if (cl[i]->s == scr) (vis(cl[i]) ? swc_window_show : swc_window_hide)(cl[i]->w);
	focus(top());
}
static void mv(A a) { if (fc && fc->ws != a.i) fc->ws = a.i, swc_window_hide(fc->w), focus(top()); }
static void cyc(A a) {
	if (a.i < 0) { back(fc); return; }
	for (int i = 0; i < n; i++)
		if (cl[i]->s == scr && vis(cl[i])) { C *c = cl[i]; put(c, 1), focus(c); return; }
}
static void fs(A a) {
	C *c = fc;
	if (!c) return;
	if ((c->fs ^= 1)) {
		c->g = IN(c)->view->base.geometry;
		swc_window_set_fullscreen(c->w, c->s->s);
		swc_window_set_geometry(c->w, &c->s->s->geometry);
	} else {
		swc_window_set_stacked(c->w);
		swc_window_set_geometry(c->w, &c->g);
	}
	put(c, 1), focus(c);
}
/* swc callbacks */
static void key(void *d, uint32_t t, uint32_t v, uint32_t st) {
	const K *k = d;
	if (st == WL_KEYBOARD_KEY_STATE_PRESSED) k->f(k->a);
}
static void drag(void *d, uint32_t t, uint32_t b, uint32_t st) {
	if (!st) {
		if (dc) swc_window_end_move(dc->w), swc_window_end_resize(dc->w);
		dc = 0;
	} else if ((dc = under()) && !dc->fs) {
		put(dc, 1), focus(dc);
		if (b == BTN_LEFT) swc_window_begin_move(dc->w);
		else swc_window_begin_resize(dc->w, SWC_WINDOW_EDGE_AUTO);
	} else dc = 0;
}
static void ub(void *d, uint32_t t, uint32_t v, uint32_t st) { /* user keys script */
	char s[192], i = (intptr_t)d;
	snprintf(s, sizeof s, "k=${LUWM_KEYS:-$HOME/.config/luwm/keys}; [ -f \"$k\" ] || k=/usr/share/luwm/keys; exec sh \"$k\" %s%c", i & 1 ? "S-" : "", KS[i / 2]);
	if (st) run((A){.s = s});
}
static void flip(void *d, uint32_t t, uint32_t b, uint32_t st) { C *c; if (st && (c = under())) back(c); }
static void gone(void *d) {
	C *c = d;
	int i = at(c);
	memmove(cl + i, cl + i + 1, (--n - i) * sizeof *cl);
	if (hv == c) hv = 0;
	if (dc == c) dc = 0;
	if (fc == c) fc = 0, focus(top());
	free(c);
}
static void enter(void *d) { if ((hv = d) != dc && vis(hv)) focus(hv); }
static const struct swc_window_handler wh = {.destroy = gone, .entered = enter};
static void scrin(void *d) { scr = d; }
static const struct swc_screen_handler sh = {.entered = scrin};
static void newscr(struct swc_screen *s) {
	S *k;
	if (!(k = calloc(1, sizeof *k))) return;
	k->s = s, scr = k;
	swc_screen_set_handler(s, &sh, k);
}
static void newwin(struct swc_window *w) {
	C *c;
	if (!scr || !(c = calloc(1, sizeof *c))) return;
	if (n == cap) { C **t = realloc(cl, (cap + 16) * sizeof *t); if (!t) { free(c); return; } cl = t, cap += 16; }
	struct swc_rectangle *u = &scr->s->usable_geometry;
	struct swc_rectangle g = {u->x + u->width / 5, u->y + u->height / 5, u->width * 3 / 5, u->height * 3 / 5};
	c->w = w, c->s = scr, c->ws = scr->ws;
	swc_window_set_handler(w, &wh, c);
	swc_window_set_stacked(w);
	swc_window_set_geometry(w, &g);
	cl[n++] = c;
	swc_window_show(w);
	focus(c);
}
static const struct swc_manager mgr = {.new_screen = newscr, .new_window = newwin};

int main(void) {
	const char *s;
	signal(SIGCHLD, SIG_IGN); /* no zombies */
	if (!(dpy = wl_display_create()) || !(s = wl_display_add_socket_auto(dpy))) return 1;
	setenv("WAYLAND_DISPLAY", s, 1);
	if (!swc_initialize(dpy, 0, &mgr)) return 1;
	BW = ev("LUWM_BORDER", BW, 10), BF = ev("LUWM_FOCUS", BF, 16) | 0xff000000, BU = ev("LUWM_UNFOCUS", BU, 16) | 0xff000000;
	for (int i = 0; i < N(keys); i++)
		swc_add_binding(SWC_BINDING_KEY, keys[i].m, keys[i].k, key, (void *)(keys + i));
	for (int i = 0; i < 72; i++) /* after builtins */
		swc_add_binding(SWC_BINDING_KEY, i & 1 ? MOD | SH : MOD, KS[i / 2], ub, (void *)(intptr_t)i);
	for (int b = BTN_LEFT; b <= BTN_MIDDLE; b++) swc_add_binding(SWC_BINDING_BUTTON, MOD, b, b == BTN_MIDDLE ? flip : drag, 0);
	wl_display_run(dpy);
	swc_finalize(), wl_display_destroy(dpy);
}
