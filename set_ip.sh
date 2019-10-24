#!/bin/bash
ip addr flush $1
ip addr add $2/24 dev $1
ip link set $1 up
