## Preparing the server
Besides running the following commands on the CentOS server the install should work:

record the ip address of your new server
in this example:

IP is say 10.209.98.119
Shells are :

%> is your local shell
$> server's shell

locally add info to your ~/.ssh/config file

    Host smartorg.pn.server

                Hostname 10.209.98.119

                User smartorg

                Port 22

                UserKnownHostsFile /dev/null

                StrictHostKeyChecking no

                PasswordAuthentication no

                IdentityFile "/Users/<<your username here>>/.ssh/id_rsa"

                IdentitiesOnly yes

                ForwardAgent yes

                LogLevel FATAL



login as root
( from your local ssh client, like CYGWIN )

    %> ssh root@10.209.98.119

    enter the following commands

    $> yum update

    $> groupadd dev

    $> useradd smartorg

    $> passwd smartorg

    $> usermod -a -G wheel smartorg

    $> usermod -a -G dev smartorg

    $> su smartorg

    $> cd && mkdir .ssh && chmod 700 .ssh && cd .ssh

    $> vi authorized_keys

    add your public ssh key here ( typically ~/.ssh/id_rsa.pub

    $> chmod 600 authorized_keys 

    $> exit 

    $> exit 


now you should be able to login as smartorguser to test

%> ssh smartorg.pn.server

now from you local shell you can run our ansible scripts

%> ansible-playbook -i local_inventory pn-server.yml --ask-become-pass -vvvv