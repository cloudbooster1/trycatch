#!/bin/bash

# Exit on any failure
set -e

# Update package lists
sudo apt-get update

# Install prerequisites
sudo apt-get install -y \
    curl \
    unzip \
    gnupg \
    software-properties-common

# Install Terraform
TERRAFORM_VERSION="1.8.5"
curl -LO "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
sudo mv terraform /usr/local/bin/
rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Verify Terraform installation
terraform -v

# Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip aws

# Verify AWS CLI installation
aws --version

# Install Ansible
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install -y ansible

# Verify Ansible installation
ansible --version

# Cleanup
sudo apt-get clean
