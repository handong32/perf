#!/bin/bash

ip addr flush enp4s0f1
ip link add name br0 type bridge
ip link set br0 up
ip addr flush enp4s0f1
ip addr add 192.168.1.230/24 dev br0
ip link set enp4s0f1 master br0
ip route add 192.168.1.0/24 via 192.168.1.230 dev br0
ip tuntap add dev tap0 mode tap multi_queue
ip link set tap0 master br0
ip link set enp4s0f1 up
ip link set tap0 up

