https://neo4j.com/docs/operations-manual/current/installation/linux/rpm/

wget http://debian.neo4j.org/neotechnology.gpg.key

rpm --import neotechnology.gpg.key

vim /etc/yum.repos.d/neo4j.repo

cat <<EOF>  /etc/yum.repos.d/neo4j.repo
[neo4j]
name=Neo4j RPM Repository
baseurl=http://yum.neo4j.org/stable
enabled=1
gpgcheck=1
EOF


systemctl start neo4j
systemctl status neo4j