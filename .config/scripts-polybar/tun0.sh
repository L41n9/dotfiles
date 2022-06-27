#!/bin/sh

IFACE=$(/usr/sbin/ifconfig | grep tun0 | awk '{print $1}' | tr -d ':')

FILE_TUN0="/tmp/tun0"
if [ "$IFACE" = "tun0" ]; then
    if [ ! -f ${FILE_TUN0} ];then
	touch ${FILE_TUN0}
	ip=$(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}')
        echo $ip > ${FILE_TUN0}
    fi

    ip=$(cat ${FILE_TUN0})
    printf "%-13s" ${ip}
else
    if [  -f ${FILE_TUN0} ];then
        rm -f ${FILE_TUN0}
    fi

    printf "%-13s" "Disconnected"
fi
