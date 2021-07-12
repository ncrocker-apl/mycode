#!/bin/bash

#Lab 16 challenge teardown script

# delete bridges
sudo ovs-vsctl del-br br0
sudo ovs-vsctl del-br br1

# delete network namespaces
sudo ip netns del wario
sudo ip netns del yoshi
