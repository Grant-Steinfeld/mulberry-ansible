#!/bin/sh
args=("$@")

cd /opt/${args[0]}/apps/setup/erlang
wget http://erlang.org/download/otp_src_17.5.tar.gz
tar -zxf otp_src_17.5.tar.gz 
cd otp_src_17.5

export ERL_TOP=`pwd`
./configure --prefix=/opt/${args[0]}/apps/erlang

export LANG=C
make
make install

# erlang should now be installed in /opt/<<application_name>>
#/opt/${args[0]}/apps/erlang/bin