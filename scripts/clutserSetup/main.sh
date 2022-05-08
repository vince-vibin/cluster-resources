#!/bin/bash

# This script is sshing into all the servers an executing the neede commands to setup the cluser
# It also intalls IP legacy tables
# cluster config: 1 master + workers

masterIP="192.168.178.200"
masterPassword="raspberry"

workersIP=("192.168.178.201" "192.168.178.202" "192.168.178.203")
workersPasswords=("raspberry" "raspberry" "raspberry")

function handleError() {
    currDate=`date +%D-%T`
    echo "$currDate | CRITICAL ERROR - Abording..."
    exit 0
}

function masterSetup() {
    currDate=`date +%D-%T`
    echo "$currDate | connecting to master $masterIP"

    putty.exe -ssh -pw $masterPassword pi@$masterIP -m ./masterSetup.sh | handleError

    currDate=`date +%D-%T`
    echo "$currDate | master finished $masterIP"
}

currDate=`date +%D-%T`
echo "$currDate | script started..."

masterSetup | handleError