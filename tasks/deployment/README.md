# Setup deployment server


### Andrew@tagonline history
[tagonline@dev-buildc7 ~]$ vi AndySetup.history.txt 

    1  groups tagonline
    2  who
    3  exit
    4  cd /opt/rangal/
    5  tree -l2
    6  tree -L2
    7  tree -L 2
    8  tree -L 3
    9  pwd
   10  cd
   11  mkdir -p RangleBuild/0
   12  cd RangleBuild/0
   13  cd ..
   14  mv RangleBuild RangalBuild
   15  cd RangalBuild/0/
   16  pwd
   17  sudo cp -Rp  /opt/rangal/1.0.0/build /home/tagonline/RangalBuild/0
   18  sudo cp -Rp  /opt/rangal/1.0.0/load /home/tagonline/RangalBuild/0
   19  pwd
   20  ls -ltra
   21  pwd
   22  dir /opt/rangal/1.0.0/bin
   23  dir load/sources/
   24  pwd
   25  ls
   26  mkdir BUILD RPMS  SOURCES  SPECS  SRPMS
   27  pwd
   28  cat > ~/.rpmmacros
   29  cat ~/.rpmmacros
   30  dir
   31  mv load build SOURCES
   32  ls -ltra
   33  sudo chown -Rh tagonline:tagonline load build
   34  mv load build SOURCES
   35  cd SOURCES/
   36  ls
   37  pwd
   38  ls
   39  tar zcf rangal.tar.gz build  load
   40  ls -ltra
   41  du -sh rangal.tar.gz
   42  pwd
   43  ls -ltra
   44  cd ..
   45  rpmbuild -v -bb SPECS/smartorg_tools.spec
   46  cd SOURCES/
   47  ls -ltra
   48  mkdir ~/tmp
   49  mv load build ~/tmp
   50  cd ..
   51  rpmbuild -v -bb SPECS/smartorg_tools.spec
   52  rpmbuild -v -bb SPECS/smartorg_tools.spec | more
   53  cd ~/tmp
   54  dir
   55  cd
   56  pwd
   57  ls
   58  cd RangalBuild/0/
   59  rpmbuild -v -bb SPECS/smartorg_tools.spec
   60  pwd
   61  cd
   62  cd tmp
   63  dir
   64  mkdir smartorg_tools-1
   65  mv build load smartorg_tools-1
   66  tar zcf ~/RangalBuild/0/SOURCES/rangal.tar.gz smartorg_tools-1
   67  cd ~/RangalBuild/0
   68  rpmbuild -v -bb SPECS/smartorg_tools.spec
   69  rpmbuild -v -bb SPECS/smartorg_tools.spec|more
   70  rpmbuild -v -bb SPECS/smartorg_tools.spec
   71  rpmbuild -v -bb SPECS/smartorg_tools.spec | more
   72  rpmbuild -v -bb SPECS/smartorg_tools.spec | more 2>&1
   73  rpmbuild -v -bb SPECS/smartorg_tools.spec | 2>&1 more
   74  rpmbuild -v -bb SPECS/smartorg_tools.spec 2>&1 | more
   75  find /home/tagonline/tmp/smartorg_tools-1/load/sources -name .git -ls
   76  rpmbuild -v -bb SPECS/smartorg_tools.spec 2>&1 | more
   77  pwd
   78  ls -ltra RPMS/noarch/smartorg_tools-1-1.noarch.rpm
   79  ls /opt
   80  sudo rpm -hv --upgrade RPMS/noarch/smartorg_tools-1-1.noarch.rpm
   81  ls /opt
   82  ls /opt/rangaltestinstall/
   83  ls /opt/rangaltestinstall/1.0.0/bin/
   84  ls /opt/rangaltestinstall/1.0.0/bin/apps/Chomolongma/
   85  sudo rpm -hv --erase RPMS/noarch/smartorg_tools-1-1.noarch.rpm
   86  sudo rpm -hv --erase smartorg_tools-1
   87  ls /opt/
   88  ls /opt/rangaltestinstall/1.0.0/bin/apps/
   89  ls ~/tmp/smartorg_tools-1/load/sources/
   90  rpmbuild -v -bb SPECS/smartorg_tools.spec 2>&1 | more
   91  dir /opt/rangaltestinstall/
   92  dir /opt/rangaltestinstall/1.0.0/
   93  dir /opt/rangaltestinstall/1.0.0/bin/
   94  dir /opt/rangaltestinstall/1.0.0/bin/apps/
   95  sudo rpm -hv --upgrade RPMS/noarch/smartorg_tools-1-1.noarch.rpm
   96  dir /opt/rangaltestinstall/1.0.0/bin/apps/
   97  dir /opt/rangaltestinstall/1.0.0/bin/service/
   98  dir /opt/rangaltestinstall/1.0.0/bin/service/AstroService/
   99  rpm -q -l smartorg_tools
  100  man rpm
  101  rpm -q -i smartorg_tools
  102  man rpm
  103  cd /etc/yum.repos.d/
  104  ls -ltra
  105  more epel.repo
  106  rpm -q -a |fgrep -i python
  107  whereis python
  108  rpm -q --whatprovides /usr/bin/python
  109  cd
  110  cd RangalBuild/0/
  111  rpmbuild -v -bb SPECS/smartorg_tools.spec 2>&1
  112  sudo rpm -hv --erase smartorg_tools-1
  113  sudo rpm -hv --upgrade RPMS/noarch/smartorg_tools-1-1.noarch.rpm
  114  rpmbuild -v -bb SPECS/smartorg_tools.spec 2>&1
  115  sudo rpm -hv --upgrade RPMS/noarch/smartorg_tools-1-1.noarch.rpm
  116  dir
  117  pwd
  118  cd RangalBuild/0/SPECS/
  119  ls -ltra
  120  emacs -nw rangal.spec
  121  sudo yum emacs
  122  sudo yum install emacs
  123  emacs -nw rangal.spec
  124  pwd
  125  dir ../SOURCES/build/
  126  dir ../SOURCES/build/rpm/
  127  dir ../SOURCES/build/rpm/SPEC/
  128  cp ../SOURCES/build/rpm/SPEC/smartorg_tools.spec .
  129  emacs -nw smartorg_tools.spec
  130  cd
  131  tree
  132  tree -L 2
  133  history
  134  history > AndySetup.history.txt
