#!/bin/bash
logger start_py_install
export HOMEDIR=/opt/bchlabs/apps

cd /opt/bchlabs/apps/setup/python2
logger about to download python tar file

wget --no-check-certificate https://www.python.org/ftp/python/2.7.8/Python-2.7.8.tar.xz

xz -d Python-2.7.8.tar.xz
#should now have a tar file to extract
tar -xvf Python-2.7.8.tar

cd Python-2.7.8
export LD_RUN_PATH=$HOMEDIR/python2/py278/lib
./configure --prefix=$HOMEDIR/python2/py278 --enable-shared

make
cd /opt/bchlabs/apps/setup/python2/Python-2.7.8
make install