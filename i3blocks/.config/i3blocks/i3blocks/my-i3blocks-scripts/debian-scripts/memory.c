#include<stdio.h>
#include<stdlib.h>
#include<string.h>

long read_value(const char* key){
	FILE* fp = fopen("/proc/meminfo","r");
	if(!fp) exit(1);
	char line[256];
	long val=-1;

	while(fgets(line,sizeof(line), fp)){
		if (strncmp(line,key,strlen(key)) == 0){
			sscanf(line + strlen(key), "%ld", &val);
			break;
		}
	}
	fclose(fp);
	return val;
}

int main(){
	long total = read_value("MemTotal:");
	long avail = read_value("MemAvailable:");
	float total_mem = (float) total / (1024.0f*1024.0f);
	float free_mem = (float) (total-avail) / (1024*1024);
	printf("%.2f / %.2f",free_mem,total_mem);
    	return 0;
}
