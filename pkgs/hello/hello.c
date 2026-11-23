#include <unistd.h>
int main(void) { return write(1, "hello from requiem\n", 19) != 19; }
