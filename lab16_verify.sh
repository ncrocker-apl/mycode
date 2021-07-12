#!/bin/bash

# snoke test lab 16 functionality

# ping Yoshi from Wario
sudo ip netns exec wario ping -c 1 10.64.0.11

# ping Wario from Yoshi
sudo ip netns exec yoshi ping -c 1 10.64.0.10
