sudo apt-get update

function handleError() {
    currDate=`date +%D-%T`
    echo "$currDate | CRITICAL ERROR - Abording..."
    exit 0
}

# setting up legacy ip tables
currDate=`date +%D-%T`
echo "$currDate | installing ipstables "

sudo apt-get install -y iptables-persistent || handleError
sudo iptables -F
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy || handleError
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy || handleError

currDate=`date +%D-%T`
echo "$currDate | iptables installed "
sleep 2

exit