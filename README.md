# setting up an CentOS 7 VM with Ansible-playbook

## Manual

### Step 1 - Before running ansible

#### login to target server and become  root and perform the following operation

    # yum update

#### make sure SELinux Disabled!!!!

#### Add dev group &  agentidea user

  groupadd dev
  useradd agentidea
  passwd agentidea
  
  usermod -a -G wheel agentidea  # for sudo
  usermod -a -G dev agentidea  

#### determine users groups

    # groups agentidea

#### setup authorized_keys



    su agentidea
    cd && mkdir .ssh && chmod 700 .ssh && cd .ssh
    
    vi authorized_keys #( add your public key)
    chmod 600 authorized_keys
    exit
    
login as agentidea user to test

try to login and su

should not need to enter password to login

su needs password

#### create alias to rackspace e.g. agentidea.pn.server

    $ vi ~/.ssh/config

e.g.

    Host agentidea.pn.server
      Hostname <<server IP address>>
      User agentidea
      Port 22
      UserKnownHostsFile /dev/null
      StrictHostKeyChecking no
      PasswordAuthentication no
      IdentityFile "/Users/<<yourusernameOnLocalHost>>/.ssh/id_rsa"
      IdentitiesOnly yes
      ForwardAgent yes
      LogLevel <<FATAL  or DEBUG>>

Change the permissions on ssh config:

    $ chmod 600 ~/.ssh/config



## known issues Flask



### needs mod_wsgi config file automated py 2.7

vi /

LoadModule wsgi_module /opt/rangal/apps/python/venv/lib/python2.7/site-packages/mod_wsgi/server/mod_wsgi-py27.so
WSGIPythonHome /opt/rangal/apps/python/venv/


### add cert

replace hostname propertly 


sudo sed -i "s/new_host_name/intel.agentidea.com/g" /opt/rangal/1.0.0/bin/wizard/Huashan/bundle.min.js && sudo sed -i "s/new_host_name/intel.agentidea.com/g" /opt/rangal/1.0.0/bin/apps/R6/bundle*.min.js && sudo sed -i "s/new_host_name/intel.agentidea.com/g" /opt/rangal/1.0.0/bin/peer/Sequoia/docs/config.js

### add bootstrap couch script to setup of couch


### permissions apache tmp and templates?


## Creat centos 7 VM 

### Requirements 
cat /etc/redhat-release
version 7

#### make sure SELinux Disabled
sudo setenforce 0
sudo vi /etc/sysconfig/selinux 
change enabled to disabled

### Rackspace
record IP address for ~/.ssh/config

##### other VM setup below

## Using ansible
#### verbose and ask password for remote sudo 
In .ssh/config, you would have defined a new server (e.g. agentidea.pn.server). This needs to also
    be in local_inventory (in this project, same folder as README.md) like so:

    [dev_hosts]
        agentidea.pn.server

Now, you are ready to run the ansible playbook from your local machine:

    $ sh build-dev-server.sh

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

### create alias to dev.local.agentidea.com
vagrant ssh-config --host dev.local.agentidea.com >> ~/.ssh/config

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

### open other than port 22 from command line on mac/linux
ssh person@host -L 5984:localhost:5984

### Windows, using PuTTy and with ssh tunnels
http://realprogrammers.com/how_to/set_up_an_ssh_tunnel_with_putty.html

### why use .ssh/config
easy management and lots of options

### why virtualenv for Python?
<tbd>

### why use systemctl ( aka systemd )
over service or /etc/init.d/
<tbd>

## On server, modify wsgi config

    $ sudo vi /etc/httpd/conf.modules.d/10-wsgi.conf
    $ WSGIPythonPath /opt/rangal/apps/python/venv



## TODO:

tmp folder permission
