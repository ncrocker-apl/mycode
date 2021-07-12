#!/bin/bash

#Lab 16 challenge build script

# create OvS bridges
sudo ovs-vsctl add-br br0
sudo ovs-vsctl add-br br1

# create network namespaces
sudo ip netns add wario
sudo ip netns add yoshi

# create bridge internal interface
sudo ovs-vsctl add-port br0 wario -- set interface wario type=internal

# plug the OvS bridge internals into the wario namespace
sudo ip link set wario netns wario

# create patch between br0 and br1
sudo ovs-vsctl add-port br0  br0-patch -- set interface br0-patch type=patch options:peer=br1-patch
sudo ovs-vsctl add-port br1  br1-patch -- set interface br1-patch type=patch options:peer=br0-patch

# create VETH
sudo ip link add yoshi2net type veth peer name net2yoshi

# plug VETH into namespace
sudo ip link set yoshi2net netns yoshi

# add IP address to interfaces
sudo ip netns exec yoshi ip a add 10.64.0.11/24 dev yoshi2net
sudo ip netns exec wario ip a add 10.64.0.10/24 dev wario

# bring interfaces up
sudo ip netns exec yoshi ip link set dev yoshi2net up
sudo ip netns exec yoshi ip link set dev lo up
sudo ip netns exec wario ip link set dev lo up
sudo ip netns exec wario ip link set dev wario up
