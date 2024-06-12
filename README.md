# kali2minikube
1. Install some necessary packages.

  ```
sudo apt update
sudo apt install -y software-properties-common apt-transport-https ca-certificates gnupg software-properties-common wget vim git w3m kubernetes-helm containerd docker.io docker-compose
```

2. Ensure we have the correct group added.
    ```
   sudo usermod -aG docker $USER && newgrp docker
   ```

3. Complete the installation.

```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_arm64.deb
sudo dpkg -i minikube_latest_arm64.deb

echo 'alias kubectl="minikube kubectl --"' >> ${HOME}/.zsh_aliases
sed -i -f ./update_zshrc.sed ${HOME}/.zshrc

alias kubectl="minikube kubectl --"

minikube start
minikube status
```
and then optionally

4. Install mongodb.
``` 
helm repo add bitnami https://charts.bitnami.com/bitnami
helm search repo bitnami
helm install mongodb bitnami/mongodb  --set image.repository=arm64v8/mongo --set image.tag=latest --set persistence.mountPath=/data/db
helm ls
```
and then configure mongo db
```
sudo apt install -y mongodb-clients

minikube kubectl get all
minikube kubectl describe deployment.apps/mongodb

MONGO_POD=$(minikube kubectl get pods | grep ^mongodb | awk '{print $1}')
echo MONGO POD IS ${MONGO_POD}
minikube kubectl describe pod/${MONGO_POD}
minikube kubectl logs pod/${MONGO_POD}

minikube kubectl expose deployment mongodb --type=NodePort --port=27017
minikube service mongodb --url
minikube kubectl port-forward svc/mongodb 27017:27017 &
minikube kubectl get all
```

I abandandoned the use of minikube recently because of https://github.com/kubernetes/minikube/issues/18231

I started off by installing kubeadm, kubelet and kubectl but I saw instability which seemed intermittent.

I decided not to fix it but to look at k3s, which is currently working well.
