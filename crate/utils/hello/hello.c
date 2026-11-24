#include <unistd.h>
static const char m[] = "hello from blackout\n";
int main(void) { return write(1, m, sizeof m - 1) != sizeof m - 1; }
