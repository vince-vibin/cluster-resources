sudo apt-get update

# setting up legacy ip tables
sudo apt-get install iptables-persistent
sudo iptables -F
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
sudo reboot