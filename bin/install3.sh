#!/bin/bash
set -xu

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_arm64.deb
sudo dpkg -i minikube_latest_arm64.deb

echo 'alias kubectl="minikube kubectl --"' >> ${HOME}/.zsh_aliases
sed -i -f ./update_zshrc.sed ${HOME}/.zshrc

alias kubectl="minikube kubectl --"

minikube start
minikube status
