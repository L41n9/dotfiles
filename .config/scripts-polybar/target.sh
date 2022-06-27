#!/bin/sh
target=$(ls /tmp | grep "target")
if [ ! -z ${target} ]; then
    ip=$(cat /tmp/${target})
    printf "%-12s" ${ip}
else
    printf "%-12s" "Waiting"
fi
