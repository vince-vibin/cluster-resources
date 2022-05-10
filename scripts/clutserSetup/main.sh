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

    putty.exe -ssh -pw $masterPassword pi@$masterIP -m ./masterSetup.sh 

    currDate=`date +%D-%T`
    echo "$currDate | master finished $masterIP"
}

function nodeSetup() {
    currDate=`date +%D-%T`
    echo "$currDate | connecting to worker $workersIP"

    for i in "${workersIP[@]}"
    do 
        putty.exe -ssh -pw $masterPassword pi@$workersIP[0] -m ./nodeSetup.sh
    done

    currDate=`date +%D-%T`
    echo "$currDate | worker finished $workersIP"
}

currDate=`date +%D-%T`
echo "$currDate | script started..."

masterSetup

nodeSetup