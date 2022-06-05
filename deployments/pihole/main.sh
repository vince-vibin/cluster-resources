#* This script needs pscp to copy the deploy file to the node 
#* get pscp here: https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html

masterIP="192.168.178.200"
masterPassword="raspberry"
masterUser="pi"

loadbalancerIP="192.168.178.202"
piholePassword="0n4BQ2l7Dbu3ViYgd4wu"

function handleError() {
    currDate=`date +%D-%T`
    echo "$currDate | CRITICAL ERROR - Abording..."
    exit 0
}

currDate=`date +%D-%T`
echo "$currDate | connecting to master $masterIP"

sed -i "s|LOAD_BALANCER_SERVER_IP_HERE|$loadbalancerIP|" ./pihole.yaml
sed -i "s|<your-password-here>|$piholePassword|" ./pihole.yaml

pscp -q -pw $masterPassword ./pihole.yaml $masterUser@$masterIP:/home/$masterUser || handleError
putty.exe -ssh -pw $masterPassword $masterUser@$masterIP -m ./deploy.sh || handleError

currDate=`date +%D-%T`
echo "$currDate | sucessfully deployed pihole"