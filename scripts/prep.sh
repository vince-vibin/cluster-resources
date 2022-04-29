#!/bin/bash

#This script is used after installing the OS on the SDCard.
#It will give the pi an IP, enable arm64, cgroup_memory and setup ssh.

ip=192.168.178.200
gateway=192.168.178.1
subnetmask=225.255.255.0
hostname=donatelloMaster
interface=eth0

SDCardBoot=K: # The SDCard Partition called "boot"

# enabling cgroup_memory
echo -n " cgroup_memory=1 cgroup_enable=memory" >> $SDCardBoot/cmdline.txt

#setting ip, gateway ...
echo -n " ip=$ip::$gateway:$subnetmask:$hostname:$interface:off" >> $SDCardBoot/cmdline.txt

#enabling arm64
echo "arm_64bit=1" >> $SDCardBoot/config.txt

#enabling ssh
touch $SDCardBoot/ssh