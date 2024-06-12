sudo apt install -y software-properties-common apt-transport-https ca-certificates gnupg software-properties-common wget vim git w3m
#curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/cgoogle.gpg
# sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

sudo apt update
sudo apt install -y kubernetes-helm containerd docker.io
# sudo apt install -y kubelet kubeadm kubectl kubernetes-helm containerd docker.io
# sudo apt-mark hold kubelet kubeadm kubectl
sudo usermod -aG docker $USER && newgrp docker

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_arm64.deb
sudo dpkg -i minikube_latest_arm64.deb

echo 'alias kubectl="minikube kubectl --"' >> .zsh_aliases

minikube start
