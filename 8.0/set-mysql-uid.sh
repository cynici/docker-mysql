#!/usr/bin/env bash
#
# Use this wrapper script as Docker entrypoint to set the UID and GID
# of 'mysql' user in container to fix data files owner
#
# CAVEAT:
# - security risk if either value conflicts already in-use in the container
#
set -ux

_uid="${MYSQL_UID:-}"
_gid="${MYSQL_GID:-}"
_script="${MYSQL_ENTRYPOINT:-/usr/local/bin/docker-entrypoint.sh}"

if [ -n "$_uid" ] && [ -n "$_gid" ] ; then
    usermod -u $_uid mysql
    groupmod -g $_gid mysql
    chown -R -h ${_uid}:${_gid} /var/lib/mysql /var/run/mysqld
    echo "mysql UID/GID set" >&2
else
    echo "Not setting mysql UID/GID" >&2
fi
# When $1=mysqld, the default entrypoint script does something wonderful
if [ -z "${1:-}" ] || [ "${1:0:1}" = '-' ]; then
    set -- mysqld "$@"
fi
# Pass control to the default entrypoint script
exec "$_script" "$@"
