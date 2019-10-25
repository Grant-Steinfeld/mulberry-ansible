### POSTFIX

### change config ... set interfaces to all
vim /etc/postfix/main.cf
#### uncomment ln 113 and comment up line 116 
#### that's about it!!

113 #inet_interfaces = all
114 #inet_interfaces = $myhostname
115 #inet_interfaces = $myhostname, localhost
116 inet_interfaces = localhost

to
113 inet_interfaces = all
114 #inet_interfaces = $myhostname
115 #inet_interfaces = $myhostname, localhost
116 #inet_interfaces = localhost

### restart postfix!
systemctl status postfix


### fix hostname for mail!
#### https://www.cyberciti.biz/faq/rhel-redhat-centos-7-change-hostname-command/
hostnamectl set-hostname yourlastplaylist.com
[root@lastlist rangal]# hostnamectl set-hostname "yourlastplaylist.com" --pretty
[root@lastlist rangal]# hostnamectl set-hostname "yourlastplaylist.com" --static
[root@lastlist rangal]# hostnamectl set-hostname "yourlastplaylist.com" --transient


[root@lastlist rangal]# hostnamectl status
   Static hostname: yourlastplaylist.com
         Icon name: computer-vm
           Chassis: vm
        Machine ID: a5ab215b8a5a43b5874910a66f7a6af1
           Boot ID: 0e9f60b2999b42ea9f0cf00019d5e384
    Virtualization: kvm
  Operating System: CentOS Linux 7 (Core)
       CPE OS Name: cpe:/o:centos:centos:7
            Kernel: Linux 3.10.0-514.6.1.el7.x86_64
      Architecture: x86-64


key items
hostname lastlist.com
digital ocean vm name lastlist.com
#add mx records to DNS ( networksolutions etc )
sudo yum install postfix
sudo vim /etc/postfix/main.cf
      change
      inet_interfaces = localhost
      to
      inet_interfaces = all
systemctl restart postfix.service
systemctl status postfix.service

#setup ip tables (firewall)
sudo yum install iptables-services
sudo vim /etc/sysconfig/iptables


history from session with Andy at Tag on getting mail to lastlist.com

  317  vim /etc/postfix/main.cf
  318  sytemctl postfix restart
  319  systemctl postfix restart
  320  systemctl restart postfix
  321  systemctl restart postfix.service
  322  systemctl status postfix.service
  323  tail -f /var/log/maillog
  324  history | usermod
  325  visudo
  326  groups tagonline
  327  tail -f /var/log/maillog
  328  vim /etc/aliases
  329  whoami
  330  newaliases
  331  vim /etc/aliases
  332  newaliases
  333  useradd grant
  334  passwd grant
  335  su grant
  336  usermod -a -G wheel grant
  337  yum install alpine
  338  su grant
  339  whoami
  340  vim /etc/aliases
  341  newaliases
  342  vim /etc/aliases
  343  newaliases
  344  su grant
  345  whoami
  346  iptables
  347  iptables -h
  348  yum list
  349  yum install iptables-services
  350  vim /etc/sysconfig/iptables
  351  systemctl restart iptables
  352  iptables -nvL INPUT
  353  iptables -nvL INPUT
  354  vim /etc/sysconfig/iptables
  355  vim /etc/sysconfig/iptables
  356  /sbin/iptables-restore
  357  /sbin/iptables-restore /etc/sysconfig/iptables
  358  iptables -nvL INPUT
  359  vim /etc/sysconfig/iptables
  360  history

[~]$ ! 357
bash: 357: command not found

[~]$ !357
/sbin/iptables-restore /etc/sysconfig/iptables
iptables-restore v1.4.21: unknown option "--reject-with"
Error occurred at line: 12
Try `iptables-restore -h' or 'iptables-restore --help' for more information.

[~]$ iptables -nvL INPUT
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
  231 13557 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
    0     0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
    1    60 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            state NEW multiport dports 22,25,80,443
   23  3444 REJECT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            reject-with icmp-host-prohibited

[~]$ vim /etc/sysconfig/iptables

[~]$ /sbin/iptables-restore /etc/sysconfig/iptables

[~]$ iptables -nvL INPUT
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
    8   480 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
    0     0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            state NEW multiport dports 22,25,80,443
    0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

