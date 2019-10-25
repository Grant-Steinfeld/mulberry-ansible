tput rev
echo "building LastList server with Ansible Playbook"
tput sgr0
ansible-playbook -i lastlist-local-inventory lastlist-server.yml --extra-vars "@lastlist-config.json" --ask-become-pass -vvvv


