
master="192.168.178.200"
TOKEN="K10d05374993ed983232cc1b27576d8b77803a0817a666e53468f8e1db207e5a0f0::server:adb16a42ee059fd6fc32488bdcddf787"

workersIP=("192.168.178.201" "192.168.178.202" "192.168.178.203")
workersPasswords=("raspberry" "raspberry" "raspberry")
workersUser=("pi" "pi" "pi")
nodeName=("worker1" "worker2" "worker3")

function handleError() {
    currDate=`date +%D-%T`
    echo "$currDate | CRITICAL ERROR - Abording..."
    exit 0
}

function ssh() {
    ip=$1
    password=$2
    user=$3
    nodeName=$4

    currDate=`date +%D-%T`
    echo "$currDate | connecting to $ip as $user"

    plink -ssh $user@$ip -pw $password "curl -sfL https://get.k3s.io | K3S_TOKEN=$TOKEN K3S_URL="https://$master:6443" K3S_NODE_NAME=$nodeName sh -"  || handleError

    currDate=`date +%D-%T`
    echo "$currDate | added $ip to the cluster"
}

for i in "${workersIP[@]}"
do
    ssh ${workersIP[$c]} ${workersPasswords[$c]} ${workersUser[$c]} ${nodeName[$c]}
    ((c=c+1))
done
