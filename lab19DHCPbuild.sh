#!/bin/bash

# create network ns
sudo ip netns add dhcp-peach
sudo ip netns add dhcp-bowser

# create OVS-internal interfaces
sudo ovs-vsctl add-port donut-plains dhcp-peach -- set interface dhcp-peach type=internal

# apply VLAN tags
sudo ovs-vsctl set port dhcp-peach tag=50
sudo ovs-vsctl set port dhcp-bowser tag=150
