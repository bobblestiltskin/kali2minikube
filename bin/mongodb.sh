#/bin/bash
set -xu
./install_mongodb_helm.sh

minikube kubectl get all
minikube kubectl describe deployment.apps/mongodb

MONGO_POD=$(minikube kubectl get pods | grep ^mongodb | awk '{print $1}')
echo MONGO POD IS ${MONGO_POD}
minikube kubectl describe pod/${MONGO_POD}
minikube kubectl logs pod/${MONGO_POD}

minikube kubectl expose deployment mongodb --type=NodePort --port=27017
minikube kubectl port-forward svc/mongodb 27017:27017 &
minikube kubectl get all

sudo apt install -y mongodb-clients
