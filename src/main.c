/*
 * PPSA01289 Launcher prototype
 *
 * Diagnostic payload only. It does not mount an image, alter kernel state,
 * register a game, or launch eboot.bin.
 */
#include <stdio.h>

int main(int argc, char **argv)
{
    (void)argc;
    (void)argv;

    puts("PPSA01289 Launcher - diagnostic prototype");
    puts("Build target: PS5 payload ELF");
    puts("No game image is bundled.");
    puts("No mount or game-launch operation is implemented.");
    return 0;
}
