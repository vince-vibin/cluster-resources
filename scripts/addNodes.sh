
master="192.168.178.200"
TOKEN="K10c0ce7162f3e964388e8e8e21ef9629ce6fdd6540c9678c856a07b4abbe87b95a::server:5dd73d4005fbbae054ae91316883e1cd"

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