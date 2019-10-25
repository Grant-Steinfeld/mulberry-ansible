
tput rev
echo "certificate creation self signed for apache2 on CentOS/RedHat/Fedora"
tput sgr0

KEYDIR=/etc/pki/tls/private
CSRDIR=/etc/pki/tls/misc
DATE=`date +%Y.%m.%d`
CERTDIR=/etc/pki/tls/certs

openssl genrsa -out  ${KEYDIR}/${HOSTNAME}.${DATE}.key 4096
openssl req -x509 -out ${CERTDIR}/${HOSTNAME}.${DATE}.crt -nodes -sha256 -days 365 -key ${KEYDIR}/${HOSTNAME}.${DATE}.key -new

ls /etc/pki/tls/private




#openssl genrsa -out key_name.key 4096
#openssl req -x509 -out cert_name.crt -nodes -sha256 -days 365 -key key_name.key -new