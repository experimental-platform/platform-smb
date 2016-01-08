#!/usr/bin/env bash
set -e

if [[ -f /templates/smb.conf ]]; then
    cp -a -f /templates/smb.conf /etc/samba/
fi

exec "$@"