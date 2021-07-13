#!/bin/bash

# apply VLAN tags
sudo ovs-vsctl set port peach tag=90
sudo ovs-vsctl set port bowser tag=90
