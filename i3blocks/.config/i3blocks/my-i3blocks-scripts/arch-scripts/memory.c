#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(void)
{
    FILE *fp = fopen("/proc/meminfo", "r");
    if (!fp) {
        perror("fopen memory not found");
        return 1;
    }

    long mem_total = 0;
    long mem_available = 0;
    char key[64];
    long value;
    char unit[16];

    while (fscanf(fp, "%63s %ld %15s\n", key, &value, unit) == 3) {
        if (strcmp(key, "MemTotal:") == 0)
            mem_total = value;
        else if (strcmp(key, "MemAvailable:") == 0)
            mem_available = value;

        if (mem_total && mem_available)
            break;
    }

    fclose(fp);

    if (!mem_total || !mem_available)
        return 1;

    long used = mem_total - mem_available;

    printf("RAM %.1f/%.1fG\n",
           used / 1024.0 / 1024.0,
           mem_total / 1024.0 / 1024.0);

    return 0;
}

