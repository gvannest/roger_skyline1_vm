iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -D INPUT -p tcp -m tcp --dport 2222 -j ACCEPT
