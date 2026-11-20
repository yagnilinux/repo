#include <unistd.h>
int main(void) { return write(1, "hello from yagni\n", 17) != 17; }
