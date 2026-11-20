#include <unistd.h>
int main(void) { return write(1, "hello from redemption\n", 22) != 22; }
