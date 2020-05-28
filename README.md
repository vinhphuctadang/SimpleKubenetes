# SimpleKubenetes
Simple kubenetes configuration for a server production mode

## Prerequisite:

1. Install kubectl: [Follow this](https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-on-linux)
2. Install minikube: [Keep follow this](https://kubernetes.io/docs/tasks/tools/install-minikube/)
Remember to start docker: ```sudo service docker start```. On windows, simply start docker service in services.msc
Start minikube: ```minikube start```
3. Run as follows:
- First build this 'server image':
```
./cmd.sh build
```
- Next, start our server:
```
./cmd.sh start
```

The server structure:
Internet
    |
[hello-kube-ingress]
    |
[hello-kube-service]
    |
[3 server replicas]
4. Stop the server infrastructure:
```
./cmd.sh stop
```

This won't stop the minikube service, we should then manually stop it if need.
