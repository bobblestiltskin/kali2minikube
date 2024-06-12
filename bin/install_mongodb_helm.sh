#/bin/bash
set -xu
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install mongodb bitnami/mongodb  --set image.repository=arm64v8/mongo --set image.tag=latest --set persistence.mountPath=/data/db
helm ls
