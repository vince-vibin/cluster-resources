#sudo apt-get update

# setting up legacy ip tables
sudo apt-get install iptables-persistent
sleep 10
sudo iptables -F
sleep 10
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
sleep 10
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
sleep 10