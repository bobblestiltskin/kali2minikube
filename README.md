# kali2minikube
Scripts to install minikube and dependencies on a vanilla kali raspberry pi 5 installation (https://www.kali.org/docs/arm/raspberry-pi-5/)

I used

dd if=./new/kali-linux-2023.4-raspberry-pi5-arm64.img of=/dev/sdg bs=64M conv=sync

to install the image to the SD card.

Check for the correct location using lsblk !! - mine was at /dev/sdg.

run install1.sh e.g. 

$ ./install1.sh | tee install1.log

$ sudo usermod -aG docker $USER && newgrp docker

$ ./install3.sh | tee install3.log

to install minikube

and then optionally

$ ./mongodb.sh | tee mongodb.log

to install mongodb.

The script, mongodb.sh, could be easily changed to install any of the other bitnami packages. 
