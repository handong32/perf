#! /bin/bash

set -x

# 20 million socket descriptors?
#echo 2000050 > /proc/sys/fs/nr_open
ulimit -n 32000
ulimit -a

# limits the maximum number of requests queued to a listen socket.
sysctl net.core.somaxconn=8196

# txqueuelen in ifconfig

sysctl net.core.netdev_max_backlog=8000
sysctl net.ipv4.tcp_max_syn_backlog=8196
