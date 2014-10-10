#!/bin/sh -e
# to be placed in /etc/network/if-up.d/
# so you can act depending on the wifi ssid 

if [ -z "$1" ]; then
    echo "$0: called with no interface" 1>&2
    exit 1;
fi

myssid=`iwconfig | grep wlan0 `


case "$myssid" in
    *Business*)
    #do something
        ;;
    *)
    #do something else
       ;;
esac

