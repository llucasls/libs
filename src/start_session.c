#include <unistd.h>
#include <signal.h>
#include <sys/wait.h>
#include <sys/types.h>

#include <ravenl/start_session.h>

void exit(int STATUS);

int kill (pid_t PID, int SIGNUM);

pid_t runfg(char *command, char *argv[], int *status_ptr);

void start_session(char *command, char *args[], pid_t login_shell_pid) {
	int status;
	runfg(command, args, &status);

	if (WIFEXITED(status)) {
		int exit_status = WEXITSTATUS(status);
		if (exit_status != 0)
			exit(exit_status);
	}

	if (login_shell_pid != 0)
		kill(login_shell_pid, SIGHUP);
}
