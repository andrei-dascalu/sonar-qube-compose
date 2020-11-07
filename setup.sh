#!/bin/bash -e


apt-get update && apt-get -y dist-upgrade && apt-get -y autoremove

apt-get -y remove docker docker-engine docker.io containerd runc

apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    git \
    nano \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get -y install docker-ce docker-ce-cli containerd.io

curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
