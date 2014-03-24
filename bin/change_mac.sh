#!/bin/bash

source ~/.colors

if [ $LINUX ]; then
    interface="eth0"
    command="hw ether"
    OLD_ADDR=`ifconfig -a $interface | grep HWaddr | cut -d" " -f11`
fi

if [ $OSX ]; then
    interface="en0"
    command="ether"
    OLD_ADDR=`ifconfig $interface | grep ether | cut -f2 | cut -d" " -f2`
fi

if [ ! -z "$1" ]; then
    interface="$1"
fi

NEW_ADDR=`openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'`

echo -en "Changing MAC address $OLD_ADDR -> $NEW_ADDR..."

ifconfig $interface $command $NEW_ADDR 2>&1 > /dev/null

# To ensure settling then off/on toggle
sleep 1
ifconfig $interface down 2>&1 > /dev/null
ifconfig $interface up 2>&1 > /dev/null

echo -e "$Green done! $Color_Reset"