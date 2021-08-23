#!/bin/bash
echo "Updating and Upgrading Linux Packages"
sleep 5
sudo apt-get -y update && 
sudo apt-get -y install software-properties-common git python3-pip &&

echo "Upgrading PIP and installing"
sleep 5
sudo pip3 install --upgrade pip &&

echo "Install kubectl"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - &&
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list &&
sudo apt-get update && sudo apt-get install -y kubectl &&

echo "Remove any old Docker items"
sudo apt remove docker docker-engine docker.io containerd runc &&

echo "Install all pre-reqs for Docker"
sleep 5
sudo apt update &&
sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common &&

echo "Add the Docker repository, we are installing from Docker and not the Ubuntu APT repo."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
sudo apt-key fingerprint 0EBFCD88 &&
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" &&

echo "Install Docker"
sleep 5
sudo apt update &&
sudo apt install -y docker-ce docker-ce-cli containerd.io &&

echo "Add your base user to the Docker group so that you do not need sudo to run docker commands"
sudo usermod -aG docker ubuntu &&

echo "Install helm"
sleep 5
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash &&

echo "Install sops"
sleep 5
wget https://github.com/mozilla/sops/releases/download/v3.7.1/sops_3.7.1_amd64.deb &&
sudo dpkg -i sops_3.7.1_amd64.deb &&
sudo rm sops_3.7.1_amd64.deb &&

echo "Install minikube"
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 &&
sudo install minikube-linux-amd64 /usr/local/bin/minikube &&


echo "Install k9s"
sudo wget https://github.com/derailed/k9s/releases/download/v0.24.15/k9s_Linux_x86_64.tar.gz &&
sudo tar -xvf k9s_Linux_x86_64.tar.gz &&
sudo mv k9s /usr/local/bin/k9s &&


echo "Install Carvel Tools"
wget -O- https://carvel.dev/install.sh | bash 