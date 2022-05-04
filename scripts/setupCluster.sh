#!/bin/bash

# This script is sshing into all the servers an executing the neede commands to setup the cluser
# It also activates IP legacy tables
# The cluster config: 1 master + workers

master=
workers=@()

currDate=`date +%D-%T`
echo "$currDate | script started..."