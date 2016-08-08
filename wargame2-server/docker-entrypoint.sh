#!/bin/bash
set -e

if [ "$1" = 'wargame' ]; then
    echo "login=\"$login\"" >login.ini
    echo "dedicated_key=\"$dedicated_key\"" >>login.ini
    shift
    exec ./wargame2-server +port_mms 10804 +ip "$ip" +port "$port" $@
fi

exec "$@"
