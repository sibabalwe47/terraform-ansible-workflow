#!/bin/bash
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible
ansible --version
sudo apt install git
git --version
cd /home/ubuntu
sudo git clone https://github.com/sibabalwe47/ansible-playbooks.git

# Install grafana and prometheus
sudo ansible-playbook /home/ubuntu/ansible-playbooks/main.yml \
     && ansible-playbook /home/ubuntu/ansible-playbooks/playbooks/docker.yml