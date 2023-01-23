#!/bin/bash
yum -y update
yum -y install epel-release

# install ansible
yum -y install ansible

# retrieve ansible code
yum -y install git
git clone https://github.com/AinaKIKISAGBE/DevOps_Tools.git
cd DevOps_Tools/ansible
ansible-galaxy install -r roles/requirements.yml
ansible-playbook install_docker.yml
sudo usermod -aG docker vagrant
cd ../jenkins
/usr/local/bin/docker-compose up -d
echo "For this Stack, you will use $(ip -f inet addr show enp0s8 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p') IP Address"
echo "login : user and password : bitnami"
