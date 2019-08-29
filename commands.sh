#to obtain the partitions and their size
sudo fdisk -l

#list sudo users
getent group sudo

#To  see a list of normal users (non system)
eval getent passwd {$(awk '/^UID_MIN/ {print $2}' /etc/login.defs)..$(awk '/^UID_MAX/ {print $2}' /etc/login.defs)} | cut -d: -f1

#Configuration reseau interne sur l'host (Vboxnet0)
VBoxManage hostonlyif ipconfig vboxnet0 --ip 192.168.10.1 --netmask 255.255.255.252

ssh-keygen -t rsa #Pour generer cle rsa publique et privee
ssh-copy-id gvannest@192.168.10.1 -p 2222 #pour envoyer la cle publique a la vm sur la session gvannest DE LA VM!! mdp session gvannest vm necessaire

ssh -p 2222 gvannest@192.168.10.1 #pour se connecter en ssh a la VM


# regles de firewall iptables
# Flushing all rules
iptables -F
iptables -X
# Setting default filter policy
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
# Allow unlimited traffic on loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
 
# Allow incoming ssh only
iptables -A INPUT -p tcp --dport 2222 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 2222 -j ACCEPT
