#!/bin/bash
logger start_py_install
args=("$@")
export HOMEDIR=/opt/${args[0]}/apps

cd /opt/${args[0]}/apps/setup/python
logger about to download python tar file

wget --no-check-certificate https://www.python.org/ftp/python/3.6.9/Python-3.6.9.tar.xz

xz -d Python-3.6.9.tar.xz
#should now have a tar file to extract
tar -xvf Python-3.6.9.tar

cd Python-3.6.9
export LD_RUN_PATH=$HOMEDIR/python/py369/lib
./configure --prefix=$HOMEDIR/python/py369 --enable-shared

make
cd /opt/${args[0]}/apps/setup/python/Python-3.6.9
make install