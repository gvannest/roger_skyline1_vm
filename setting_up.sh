sh install_script.sh
cp -r ./interfaces /etc/network/
cp -r ./interfaces.d/* /etc/network/interfaces.d/
iptables -A INPUT -p tcp --dport 2222 --jump ACCEPT
