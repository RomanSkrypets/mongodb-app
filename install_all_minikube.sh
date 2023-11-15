#!/bin/bash
echo "Do you want to start install Kind ? (y/n)"
read answer
if [[ ( $answer == "y" ) ]];
then
    echo "install OpenSSH server"
    sudo sudo apt update && sudo apt upgrade
    sudo apt install openssh-server

    echo "Enable ssh"
    sudo systemctl enable --now ssh

    echo "Status ssh"
    sudo systemctl status ssh | grep "Active"
    sleep 3;



    echo "Installing Docker..."
    echo "Update system"
    sudo sudo apt update && sudo apt upgrade
    
    echo "Install a few prerequisite packages"
    sudo apt install apt-transport-https ca-certificates curl software-properties-common
    
    echo "Add the GPG key for the official Docker repository to your system"
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    
    echo "Add the Docker repository to APT sources"
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
    
    apt-cache policy docker-ce
    
    echo "Install Docker..."
    sudo apt install docker-ce
    
    echo "Status Docker"
    sudo systemctl enable docker
    sudo systemctl status docker | grep "Active"
    sleep 3;
    
    echo "Executing Docker without sudo"
    sudo usermod -aG docker $USER

        
        
    echo "Install Kubelet service"
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
    echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
    sleep 5;

    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    chmod +x kubectl
    mkdir -p ~/.local/bin
    mv ./kubectl ~/.local/bin/kubectl

    echo "Test kubelet version YAML"
    kubectl version --client --output=yaml
    sleep 5;



    echo "Install Minikube"
    echo "Downloading package...."
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube

    sudo mkdir -p /usr/local/bin/
    sudo install minikube /usr/local/bin/


    echo "Checking status minikube"
    minikube status
    sleep 5;



    echo "Instalation COMPLETE"
    sleep 5;
    
else
echo "Download cancelled"
fi