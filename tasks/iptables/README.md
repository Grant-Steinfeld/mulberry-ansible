#iptables

setup iptables-services

## edit table
sudo vim /etc/sysconfig/iptables

### from original.txt
#### here only ssh allowed

### to ideal.txt
#### here we drop pinging
#### allow multiports 


#### restart gracefully
/sbin/iptables-restore /etc/sysconfig/iptables
##### warn if errors (syntax) -> firewall go down!!
systemctl restart iptables 

#### always check
#### status iptables rules
iptables -nvL INPUT
