
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

