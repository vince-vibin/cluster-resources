#!/bin/bash

# This script is sshing into all the servers an executing the neede commands to setup the cluser
# It also intalls IP legacy tables
# cluster config: 1 master + workers

# --- WARNING: All the nodes + the master will be rebootet ---

masterIP="192.168.178.200"
masterPassword="raspberry"
masterUser="pi"

workersIP=("192.168.178.201" "192.168.178.202" "192.168.178.203")
workersPasswords=("raspberry" "raspberry" "raspberry")
workersUser=("pi" "pi" "pi")

function handleError() {
    currDate=`date +%D-%T`
    echo "$currDate | CRITICAL ERROR - Abording..."
    exit 0
}

function ssh() {
    ip=$1
    password=$2
    user=$3

    currDate=`date +%D-%T`
    echo "$currDate | connecting to $ip as $user"

    putty.exe -ssh -pw $password $user@$ip -m ./installer.sh 

    currDate=`date +%D-%T`
    echo "$currDate | finished install on: $ip"
}


currDate=`date +%D-%T`
echo "$currDate | script started..."

ssh $masterIP $masterPassword $masterUser

c=0
for i in "${workersIP[@]}"
do
    ssh $i ${workersPasswords[$c]} ${workersUser[$c]}
    ((c=c+1))
done

currDate=`date +%D-%T`
echo "$currDate | script finished"

currDate=`date +%D-%T`
echo "$currDate | please reboot your pcs to finish the install"