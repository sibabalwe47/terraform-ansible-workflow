#!/bin/bash
sudo apt update

sudo apt install software-properties-common

sudo add-apt-repository --yes --update ppa:ansible/ansible

sudo apt install -y wget unzip ansible curl git

sudo wget --quiet https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip \
    && unzip terraform_0.11.3_linux_amd64.zip \
    && mv terraform /usr/bin \
    && rm terraform_0.11.3_linux_amd64.zip

sudo wget -q -O tfsec https://github.com/aquasecurity/tfsec/releases/download/v0.58.6/tfsec-linux-amd64  \
    && chmod +x ./tfsec \
    && mv ./tfsec /usr/local/bin/tfsec

sudo curl -fsSL https://raw.githubusercontent.com/infracost/infracost/master/scripts/install.sh | sh

sudo curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

cd /home/ubuntu

sudo git clone https://github.com/sibabalwe47/terraform-ansible-workflow.git

# Install grafana and prometheus
sudo ansible-playbook /home/ubuntu/terraform-ansible-workflow/ansible/main.yml