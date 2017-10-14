#!/bin/bash

# A positionner dans l'environnement
# export DOCKERURL='XXXXXXXXXXX'

sudo -E sh -c 'echo "$DOCKERURL/centos" > /etc/yum/vars/dockerurl'
sudo yum install -y yum-utils
sudo -E yum-config-manager \
    --add-repo \
    "$DOCKERURL/centos/docker-ee.repo"
sudo yum -y install docker-ee
sudo systemctl start docker
sudo usermod -aG docker treeptik
sudo systemctl enable docker
