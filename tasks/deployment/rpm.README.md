# smartorg tool suite RPM deployment feature set

## install existing rpm

### prerequistes on a new VM
## add the smartorg user
groupadd dev
useradd smartorg
passwd smartorg
gpasswd -a smartorg wheel
gpasswd -a smartorg dev

### the install
wget https://108.166.27.123/smartorg_tools-1-1.src.rpm --no-check-certificate
rpm --checksig smartorg_tools-1-1.src.rpm
    smartorg_tools-1-1.src.rpm: sha1 md5 OK
rpm -ivh smartorg_tools-1-1.src.rpm

#### reference to the rpm install
http://www.tecmint.com/20-practical-examples-of-rpm-commands-in-linux/


### pre-requisites
need to setup rpmbuild & git ( via ansible setup_build_packages.yml )


#### setup target dir for sources
### _sourcedir
cd /opt/rangal/1.0.0/load/sources

git clone git@github.com:smartorg/dev.git

    #step one
    echo "%_topdir /home/tagonline/RangalBuild/0" > ~/.rpmmacros 



### setup script to copy files out of git to build folder
### $to_do: standardise tmp git dir
vi /opt/rangal/build/mv.sh

#!/bin/bash
cd /opt/rangal/build

rm -rf ./sources/smartorg_tools-1
mkdir smartorg_tools-1
 
rsync -rv --exclude=.git ../sources/* ./sources/smartorg_tools-1

tput rev
tree ./sources/smartorg_tools-1 -L 2
tput sgr0


### prepare zip
tar czvf smartorg_tools-1.tar.gz ./smartorg_tools-1/

tree /opt/rangal/build

├── mv.sh
├── README.md
├── smartorg_tools-1.tar.gz
└── sources
    └── Chomolongma


As the user that builds the RPM (my case smartorg_tools) change directory to the spec directory
cd /home/smartorg_tools/rpm/SPECS

#### Call rpmbuild with the command to create the binary rpm
rpmbuild -ba /opt/rangal/1.0.0/build/rpm/SPEC/smartorg_tools.spec

### healthy dir tree ...

mkdir /home/smartorg/rpm

[smartorg@dev-centosbase rpm]$ tree
.
├── BUILD
│   └── smartorg_tools-1
│       ├── Chomolongma
│       │   └── app_files_end_up_here
│       ├── debugfiles.list
│       ├── debuglinks.list
│       ├── debugsources.list
│       └── elfbins.list
├── BUILDROOT
├── RPMS
│   └── noarch
│       └── smartorg_tools-1-1.noarch.rpm
├── SOURCES
│   └── smartorg_tools-1
│       └── smartorg_tools-1.tar.gz
├── SPECS
│   └── smartorg-tools.spec
└── SRPMS
    └── smartorg_tools-1-1.src.rpm



unzipped tar ...
├── opt
│   └── rangal
│       └── 1.0.0
│           └── build
│               └── sources
│                   └── smartorg_tools-1
│                       ├── AstroService
│                       └── dev