#!/bin/bash
echo "Updating and Upgrading Linux Packages"
sleep 5
sudo apt-get -y update && 
sudo apt-get -y install software-properties-common git python3-pip &&

echo "Install helm"
sleep 5
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash &&

echo "Install sops"
sleep 5
wget https://github.com/mozilla/sops/releases/download/v3.7.1/sops_3.7.1_amd64.deb &&
sudo dpkg -i sops_3.7.1_amd64.deb &&
sudo rm sops_3.7.1_amd64.deb &&


echo "Install k9s"
sudo wget https://github.com/derailed/k9s/releases/download/v0.24.15/k9s_Linux_x86_64.tar.gz &&
sudo tar -xvf k9s_Linux_x86_64.tar.gz &&
sudo mv k9s /usr/local/bin/k9s &&


echo "Install Carvel Tools"
sudo wget -O- https://carvel.dev/install.sh | sudo bash 