#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#define BATTERY_PATH "/sys/class/power_supply/BAT0/"

int readFile(const char *path, char *buffer, size_t size){
FILE *fp = fopen(path,"r");

if (!fp){
return -1;
}

if(!fgets(buffer,size,fp)){
fclose(fp);
return -1;
}

fclose(fp);
return 0;
}

int main(void)
{
char capacity[4];
char status_string[16];
char path1[64];
char path2[64];

snprintf(path1,sizeof(path1),"%scapacity",BATTERY_PATH);
snprintf(path2,sizeof(path2),"%sstatus",BATTERY_PATH);
if(readFile(path1,capacity,sizeof(capacity))!=0){
fprintf(stderr,"NO BATTERY!");
return 1;
}


if(readFile(path2,status_string,sizeof(status_string))!=0){
fprintf(stderr,"NO STATUS!");
return 1;
}

capacity[strcspn(capacity,"\n")]='\0';
status_string[strcspn(status_string,"\n")]='\0';

if(strcmp("Discharging",status_string)==0){
    printf("BATTERY:%s/100 \n",capacity);
    return 0;
}
printf("BATTERY:%s/100 %s\n",capacity,status_string);
return 0;
}
