#!/bin/bash

#on bastion
#exec commands from bastion.yaml if needed 

su
cd
ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa

vi /etc/hosts
vi /etc/ansible/ansible.cfg
vi /etc/ansible/hosts

vi /root/.test_vault_pw
ansible-vault create ~/vault.yaml
ansible-vault edit ~/vault.yaml

#cp playbooks to /root or other dir

ansible-playbook -e 'host_key_checking=False' -e@~vault.yaml --ask-pass /root/copysshkey.yml

cd /usr/share/ansible/openshift-ansible
ansible-playbook -e@~vault.yaml playbooks/prerequisites.yml
ansible-playbook -e@~vault.yaml playbooks/deploy_cluster.yml






