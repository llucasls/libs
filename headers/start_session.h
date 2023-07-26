#ifndef START_SESSION_H
#define START_SESSION_H

#include <sys/types.h>

void start_session(char *command, char *args[], pid_t login_shell_pid);

#endif
