# mongodb-app
For using service follow this step:
  1. Run install_all.sh script for install GO, Docker, Kind, kubelet services. ( before run script use //# **sudo chmod 755 install_all.sh** )
  2. After success install - run command **kind create cluster** for create your own Kubernetes cluster.
  3. Use command for delpoy mongo application in Kubernetes

kubectl apply commands in order

kubectl apply -f mongo-secret.yaml
kubectl apply -f mongo.yaml
kubectl apply -f mongo-configmap.yaml 
kubectl apply -f mongo-express.yaml



kubectl get commands

kubectl get pod
kubectl get pod --watch
kubectl get pod -o wide
kubectl get service
kubectl get secret
kubectl get all | grep mongodb



kubectl debugging commands

kubectl describe pod mongodb-deployment-xxxxxx
kubectl describe service mongodb-service
kubectl logs mongo-express-xxxxxx