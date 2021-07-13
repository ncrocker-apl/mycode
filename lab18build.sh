#!/bin/bash

#create net ns
sudo ip netns add mario && sudo ip netns add yoshi

# create bridge-internal interfaces
sudo ovs-vsctl add-port donut-plains mario -- set interface mario type=internal && sudo ovs-vsctl add-port donut-plains yoshi -- set interface yoshi type=internal

# plug in bridge-internals into namespaces
sudo ip link set mario netns mario && sudo ip link set yoshi netns yoshi

#  bring interfaces up
sudo ip netns exec mario ip link set dev mario up && sudo ip netns exec yoshi ip link set dev yoshi up && sudo ip netns exec mario ip link set dev lo up && sudo ip netns exec yoshi ip link set dev lo up

# add IP addresses to interfaces
sudo ip netns exec mario ip addr add 10.64.1.2/24 dev mario && sudo ip netns exec yoshi ip addr add 10.64.1.3/24 dev yoshi
