# mongodb-app
For using service follow this step:
  1. You must have installed Docker, Kubelet services and Minikube OR you can use **install_all_minilube.sh** with permission 755 on Linux
  2. Use this commands for delpoying mongo application in Kubernetes

**minikube start --driver=docker**

### kubectl apply commands in order

  kubectl apply -f mongo-secret.yaml\
  kubectl apply -f mongo-deploy.yaml\
  kubectl apply -f mongo-configmap.yaml\
  kubectl apply -f mongo-express.yaml

### kubectl get commands

  kubectl get pod\
  kubectl get pod --watch\
  kubectl get pod -o wide\
  kubectl get service\
  kubectl get secret\
  kubectl get all | grep mongodb


### kubectl debugging commands

  kubectl describe pod mongodb-deployment-xxxxxx\
  kubectl describe service mongodb-service\
  kubectl logs mongo-express-xxxxxx
