#!/bin/bash

# Copy current state to /tmp/ovs2-link-init
ip link list > /tmp/ovs2-link-init
ip addr show > /tmp/ovs2-addr-init
ip route show > /tmp/ovs2-route-init
sudo ovs-vsctl show > /tmp/ovs2-show-init
