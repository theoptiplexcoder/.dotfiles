#include <stdio.h>
#include <stdlib.h>

#define STATE_FILE "/tmp/i3blocks_cpu_state"

int main(void) {
    unsigned long long user, nice, system, idle, iowait, irq, softirq, steal;
    unsigned long long prev_total = 0, prev_idle = 0;

    FILE *fp = fopen("/proc/stat", "r");
    if (!fp) return 1;

    fscanf(fp, "cpu %llu %llu %llu %llu %llu %llu %llu %llu",
           &user, &nice, &system, &idle,
           &iowait, &irq, &softirq, &steal);
    fclose(fp);

    unsigned long long idle_time = idle + iowait;
    unsigned long long total_time =
        user + nice + system + idle + iowait + irq + softirq + steal;

    fp = fopen(STATE_FILE, "r");
    if (fp) {
        fscanf(fp, "%llu %llu", &prev_total, &prev_idle);
        fclose(fp);
    }

    fp = fopen(STATE_FILE, "w");
    if (fp) {
        fprintf(fp, "%llu %llu", total_time, idle_time);
        fclose(fp);
    }

    if (prev_total == 0) {
        printf("CPU: ?%%\n");
        return 0;
    }

    unsigned long long delta_total = total_time - prev_total;
    unsigned long long delta_idle  = idle_time - prev_idle;

    double usage = 100.0 * (delta_total - delta_idle) / delta_total;
    printf("CPU: %.0f%%\n", usage);

    return 0;
}

