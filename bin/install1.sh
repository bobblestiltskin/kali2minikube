#!/bin/bash
set -xu
sudo apt update
sudo apt install -y software-properties-common apt-transport-https ca-certificates gnupg software-properties-common wget vim git w3m kubernetes-helm containerd docker.io
