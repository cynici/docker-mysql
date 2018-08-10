# MySQL server in docker

Uses the official MySQL docker [base image](https://hub.docker.com/_/mysql/) but allows the UID/GID of `mysql` user to be defined.

Official git repo: https://github.com/docker-library/mysql/

## Usage

`set-mysql-uid.sh` only works when both the following are set:

- MYSQL_UID
- MYSQL_GID

The script is hardcoded to pass control to `/usr/local/bin/docker-entrypoint.sh`
