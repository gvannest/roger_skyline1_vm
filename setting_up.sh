sh install_script.sh
cp -r ./interfaces /etc/network/
cp -r ./interfaces.d/* /etc/network/interfaces.d/
cp -r ./sshd_config /etc/ssh/

iptables -A INPUT -p tcp --dport 2222 --jump ACCEPT
