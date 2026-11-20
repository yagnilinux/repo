#include <unistd.h>
int main(void) { return write(1, "hello from sidewinder\n", 22) != 22; }
