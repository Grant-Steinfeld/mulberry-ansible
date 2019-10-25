# setting up an CentOS 7 VM with Ansible-playbook


## Creat centos 7 VM 
### Rackspace
record IP address for ~/.ssh/config


#### login as root and perform the following operation
yum update

##### add dev group
##### add smartorg user
  groupadd dev
  
  useradd smartorg
  
  passwd smartorg
  
  usermod -a -G wheel smartorg
  
  usermod -a -G dev smartorg

#### determine users groups
groups smartorg

##### smartorg is in wheel group ... so can sudo ...
##### setup authorized_keys
su smartorg

cd && mkdir .ssh && chmod 700 .ssh && cd .ssh

vi authorized_keys #( add your public key)

chmod 600 authorized_keys

exit

exit

login as smartorguser to test



try to login and su 
should not need to enter password to login
su needs password

### create alias to rackspace e.g. smartorg.pn.server

vi ~/.ssh/config

e.g.

    Host smartorg.pn.server
      Hostname <<server IP address>>
      User smartorg
      Port 22
      UserKnownHostsFile /dev/null
      StrictHostKeyChecking no
      PasswordAuthentication no
      IdentityFile "/Users/<<yourusernameOnLocalHost>>/.ssh/id_rsa"
      IdentitiesOnly yes
      ForwardAgent yes
      LogLevel <<FATAL  or DEBUG>>

chmod 600 ~/.ssh/config

## On server, modify wsgi config

sudo vi /etc/httpd/conf.modules.d/10-wsgi.conf
WSGIPythonPath /opt/rangal/apps/python/venv

##### other VM setup below

## Using ansible
#### verbose and ask password for remote sudo 
ansible-playbook -i local_inventory pn-server.yml --ask-become-pass -vvvv

## Local VM setup
### vmware Fusion
### CentOS 7 (workstation)

#### enable networking
http://www.krizna.com/centos/setup-network-centos-7/

#### enable Gnome Desktop
sudo yum groupinstall "Server with GUI"

<< follow steps above >>

### vagrant VM
download vagrant <<image>>
### set  vagrantfile vm

### create alias to dev.local.smartorg.com
vagrant ssh-config --host dev.local.smartorg.com >> ~/.ssh/config

http://nerderati.com/2011/03/17/simplify-your-life-with-an-ssh-config-file/

### assume vagrant setup and running
cd ./VM
vagrant up

#### test
vagrant ssh



### todo:
download virtuilbox

http://download.virtualbox.org/virtualbox/5.0.32/VirtualBox-5.0.32-112930-OSX.dmg



## NOTES

### why use .ssh/config

### why virtualenv for Python?
<tbd>

### why use systemctl ( aka systemd )
over service or /etc/init.d/
<tbd>

