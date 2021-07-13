#!/bin/bash

# tag VLAN 70
sudo ovs-vsctl set port mario tag=70
sudo ovs-vsctl set port yoshi tag=70
