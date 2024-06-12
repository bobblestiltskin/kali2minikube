# kali2k3s
root history
    9  cat /proc/swaps
   10  cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
   11  overlay
   12  br_netfilter
   13  EOF
   14  cat /etc/modules-load.d/containerd.conf 
   15  modprobe overlay
   16  modprobe br_netfilter
   17  cat /etc/sysctl.d
   18  ls /etc/sysctl.d
   19  cat /etc/sysctl.d/README.sysctl 
   20  cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
   21  net.bridge.bridge-nf-call-iptables  = 1
   22  net.ipv4.ip_forward                 = 1
   23  net.bridge.bridge-nf-call-ip6tables = 1
   24  EOF
  121  curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644
 2096  cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
 2105  dpkg --list docker.io
 2108  dmesg | grep mmand
 2109  kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
 2110  sudo apt install helm
 2113  sudo apt search helm
 2136  helm repo add bitnami https://charts.bitnami.com/bitnami\nhelm search repo bitnami
 2172  ./write_secrets > service.secrets.yaml
 2173  kubectl apply -f service.secrets.yaml
 2177  mongo --host 10.42.0.10
 2178  cat book-backend.yaml
 2179  kubectl apply -f book-backend.yaml
 2180  kubectl logs deployment.apps/book-backend
 2182  kubectl describe service/book-backend-service
 2200  ./runme_arm64.helm.sh
 2223  kubectl describe deployment.apps/mongodb
 2227  mongo --host 10.109.188.232
 2326  kubectl describe service/mongodb | grep ^Endpoints | awk '{print $2}'
 2336  echo "k3s kubectl expose pod webtest --target-port 8080 --name webtest --type=LoadBalancer" > make_lb.sh
 2366  kubectl describe service/book-backend | grep ^LoadBa | awk '{print $NF}'
