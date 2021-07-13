#!/bin/bash

# remove ns
sudo ip netns del peach
sudo ip netns del dhcp-peach
sudo ip netns del bowser
sudo ip netns del dhcp-bowser

# remove bridges
sudo ovs-vsctl del-br donut-plains
