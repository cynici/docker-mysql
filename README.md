# MySQL server in docker

Uses the official MySQL docker [base image](https://hub.docker.com/_/mysql/) but allows the UID/GID of `mysql` user to be defined.

Official git repo: https://github.com/docker-library/mysql/

## Usage

`set-mysql-uid.sh` only kicks into action when both the following environment variables are set to valid numeric user and group ID, typically, those of the Linux user running the Docker image, so that files and directories created in `/var/lib/mysql` (in container) are owned and accessible.

- MYSQL_UID
- MYSQL_GID

Be default, this entrypoint script passes control to `/usr/local/bin/docker-entrypoint.sh` unless environment variable MYSQL_ENTRYPOINT points to another script.
