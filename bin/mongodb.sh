helm repo add bitnami https://charts.bitnami.com/bitnami
helm search repo bitnami
helm install mongodb bitnami/mongodb  --set image.repository=arm64v8/mongo --set image.tag=latest --set persistence.mountPath=/data/db
helm ls
kubectl="minikube kubectl --"
kubectl get all
kubectl describe deployment.apps/mongodb

MONGO_POD=$(kubectl get pods | grep ^mongodb | awk '{print $1}')
kubectl describe pod/${MONGO_POD}
kubectl logs pod/${MONGO_POD}

kubectl expose deployment mongodb --type=NodePort --port=27017
kubectl port-forward svc/mongodb 27017:27017 &
kubectl get all

sudo apt install -y mongodb-clients

# > show dbs
# admin   0.000GB
# config  0.000GB
# local   0.000GB
# > use test
# switched to db test
# > db.test.insertOne( {name : "deb" })
# {
# 	"acknowledged" : true,
# 	"insertedId" : ObjectId("6581e6b0b0501354fed2d100")
# }
# > db.test.find()
# { "_id" : ObjectId("6581e6b0b0501354fed2d100"), "name" : "deb" }
# > 
# 
