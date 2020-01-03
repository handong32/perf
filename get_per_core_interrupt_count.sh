#! /bin/bash

#set -x
set -e

s=3
for i in `seq 0 1 16`;
do
    cat /proc/interrupts | grep -m 1 enp4s0f1-TxRx-$i | tr -s ' ' | cut -d ' ' -f $s
    s=$((s+1))
done
