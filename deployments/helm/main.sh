masterIP="192.168.178.200"
masterPassword="raspberry"
masterUser="pi"

function handleError() {
    currDate=`date +%D-%T`
    echo "$currDate | CRITICAL ERROR - Abording..."
    exit 0
}

currDate=`date +%D-%T`
echo "$currDate | connecting to master $masterIP"

putty.exe -ssh -pw $masterPassword $masterUser@$masterIP -m ./install.sh || handleError

currDate=`date +%D-%T`
echo "$currDate | installed helm $masterIP"