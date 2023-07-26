#ifndef RUN_H
#define RUN_H
#include <sys/types.h>

pid_t runbg(char *command, char *argv[]);

pid_t runfg(char *command, char *argv[], int *status_ptr);

#endif
