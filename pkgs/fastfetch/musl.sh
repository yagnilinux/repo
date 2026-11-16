#!/bin/sh -e
# musl's string.h declares basename() with no prototype, which C23 reads as
# "takes nothing". Use strrchr instead of libgen's basename.
for f in src/detection/initsystem/initsystem_linux.c src/detection/displayserver/linux/wmde.c; do
    sed -i 's|^#include <libgen.h>$||' "$f"
    sed -i 's|basename(result->exe.chars)|(strrchr(result->exe.chars, '"'"'/'"'"') ? strrchr(result->exe.chars, '"'"'/'"'"') + 1 : result->exe.chars)|' "$f"
    sed -i 's|basename(exePath)|(strrchr(exePath, '"'"'/'"'"') ? strrchr(exePath, '"'"'/'"'"') + 1 : exePath)|' "$f"
done
