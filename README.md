# kali2minikube
I used

dd if=./new/kali-linux-2023.4-raspberry-pi5-arm64.img of=/dev/sdg bs=64M conv=sync

to install the image to the SD card. dd is sometimes called 'Disk Destroyer'.

I wrote a sort script (apt.sh) to install minikube and dependencies on a vanilla kali raspberry pi 5 installation (https://www.kali.org/docs/arm/raspberry-pi-5/)

Also a script (hello.sh) to install hello-minikube and one to install mongodb (mongodb.sh).

I abandandoned the use of minikube recently because of https://github.com/kubernetes/minikube/issues/18231

I started off by installing kubeadm, kubelet and kubectl but I saw instability which seemed intermittent.

I decided not to fix it but to look at k3s, which is currently working well.
