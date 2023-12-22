# kali2minikube
Scripts to install minikube and dependencies on a vanilla kali raspberry pi 5 installation (https://www.kali.org/docs/arm/raspberry-pi-5/)

I used

dd if=./new/kali-linux-2023.4-raspberry-pi5-arm64.img of=/dev/sdg bs=64M conv=sync

to install the image to the SD card.

Check for the correct location using lsblk !! - mine was at /dev/sdg.

The following scripts can be viewed in https://github.com/bobblestiltskin/kali2minikube/tree/main/bin  

or cloned at https://github.com/bobblestiltskin/kali2minikube

1. run install1.sh

   e.g. $ ./install1.sh | tee install1.log

  install1.sh contains
  ```
#!/bin/bash
set -xu
sudo apt update
sudo apt install -y software-properties-common apt-transport-https ca-certificates gnupg software-properties-common wget vim git w3m kubernetes-helm containerd docker.io
```

3. $ sudo usermod -aG docker $USER && newgrp docker

4. $ ./install3.sh | tee install3.log to install minikube
  install3.sh contains
```
#!/bin/bash
set -xu

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_arm64.deb
sudo dpkg -i minikube_latest_arm64.deb

echo 'alias kubectl="minikube kubectl --"' >> ${HOME}/.zsh_aliases
sed -i -f ./update_zshrc.sed ${HOME}/.zshrc

alias kubectl="minikube kubectl --"

minikube start
minikube status
```

and then optionally

$ ./mongodb.sh | tee mongodb.log

to install mongodb.

The script, mongodb.sh, could be easily changed to install any of the other bitnami packages. 
