
cd /opt/lastlist/apps/setup/rabbitmq

wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.6.5/rabbitmq-server-generic-unix-3.6.5.tar.xz
tar xvf rabbitmq-server-generic-unix-3.6.5.tar.xz
mv rabbitmq_server-3.6.5 /opt/lastlist/apps

# ensure plugins setup
# rabbitmq-plugins start with PATH set to erlang
# start rabbit mq



