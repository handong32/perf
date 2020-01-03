#! /bin/bash

#set -x
set -e

export CORES=${CORES:=}

function disable()
{
    for c in $CORES;
    do
	if [ $c -eq 0 ]; then
	    echo "Cannot disable core 0"
	else
	    echo 0 > /sys/devices/system/cpu/cpu"$c"/online
	fi
    done
    echo "nproc:"
    nproc
}

function enable()
{
    for c in $CORES;
    do
	if [ $c -eq 0 ]; then
	    echo "Cannot re-enable core 0"
	else
	    echo 1 > /sys/devices/system/cpu/cpu"$c"/online
	fi
    done
    echo "nproc:"
    nproc
}

function enable_all()
{
    for u in `seq 1 1 15`;
    do
	echo 1 > /sys/devices/system/cpu/cpu"$u"/online
    done
}

function query()
{
    for u in `seq 1 1 15`;
    do
	echo "Core" $u
	cat /sys/devices/system/cpu/cpu"$u"/online
    done
}

$1 
