#!/bin/bash
set -e

if [ "$1" = 'wargame' ]; then
    echo "login=\"$login\"" >login.ini
    echo "dedicated_key=\"$dedicated_key\"" >>login.ini
    shift
    exec ./wargame3-server +port 10001 +port_mms 10804 +ip "$ip" $@
fi

exec "$@"
