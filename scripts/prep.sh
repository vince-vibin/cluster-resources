#!/bin/bash

#* This script is used after installing the OS on the SDCard.
#* It will give the pi an IP, enable arm64, cgroup_memory and setup ssh.

ip=192.168.178.201
gateway=192.168.178.1
subnetmask=225.255.255.0
hostname=rpcworker1
interface=eth0

SDCardBoot=K: # The SDCard Partition called "boot"

currDate=`date +%D-%T`
echo "$currDate | script started..."

#error handling
function handleError()
{
    currDate=`date +%D-%T`
    echo "$currDate | CRITICAL ERROR - Abording..."
    exit 0
}

#removing new line char of file
truncate -s -1 $SDCardBoot/cmdline.txt

# enabling cgroup_memory
echo -n " cgroup_memory=1 cgroup_enable=memory" >> $SDCardBoot/cmdline.txt || handleError

currDate=`date +%D-%T`
echo "$currDate | cgroup enabled"

#setting ip, gateway ...
currDate=`date +%D-%T`
echo -n " ip=$ip::$gateway:$subnetmask:$hostname:$interface:off" >> $SDCardBoot/cmdline.txt || handleError

#enabling arm64
echo "arm_64bit=1" >> $SDCardBoot/config.txt || handleError

currDate=`date +%D-%T`
echo "$currDate | enabled arm64"

#enabling ssh
touch $SDCardBoot/ssh || handleError

currDate=`date +%D-%T`
echo "$currDate | ssh file generated"

currDate=`date +%D-%T`
echo "$currDate | script finished your ip is: $ip"



# Hallo maya