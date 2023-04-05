#!/bin/bash
sudo yum upgrade -y

sudo amazon-linux-extras install epel -y

sudo yum install ansible -y

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

sudo yum upgrade -y

sudo amazon-linux-extras install java-openjdk11 -y

sudo yum install jenkins -y

sudo systemctl enable jenkins

sudo systemctl start jenkins

sudo yum install -y wget unzip ansible curl git

sudo wget --quiet https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip \
    && unzip terraform_0.11.3_linux_amd64.zip \
    && mv terraform /usr/bin \
    && rm terraform_0.11.3_linux_amd64.zip

sudo wget -q -O tfsec https://github.com/aquasecurity/tfsec/releases/download/v0.58.6/tfsec-linux-amd64  \
    && chmod +x ./tfsec \
    && mv ./tfsec /usr/local/bin/tfsec

sudo curl -fsSL https://raw.githubusercontent.com/infracost/infracost/master/scripts/install.sh | sh

sudo curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

mkdir /home/ubuntu

cd /home/ansible

sudo git clone https://github.com/sibabalwe47/terraform-ansible-workflow.git

# Install grafana and prometheus
sudo ansible-playbook /home/ansible/terraform-ansible-workflow/ansible/main.yml