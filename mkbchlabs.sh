tput rev
echo "building BCH.LABS server with Ansible Playbook"
tput sgr0
ansible-playbook -i bchlabs-local-inventory bchlabs-server.yml --extra-vars "@bchlabs-config.json" --ask-become-pass -vvvv

