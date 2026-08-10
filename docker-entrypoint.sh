#!/bin/sh
set -e
if [ -n "${PORT:-}" ]; then
    sed -i "s/^Listen [0-9][0-9]*/Listen ${PORT}/" /etc/apache2/ports.conf
fi
exec "$@"
