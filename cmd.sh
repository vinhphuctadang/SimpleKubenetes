build(){
  '''
    Firstly, we have to build our app "image".
    Building such images take lots of time and memory, but be patient since we need them for efficient deployment
    Behaviors of following lines are ellaborated in comments next to it
  '''
  docker build -t hello-kube . # Build the 'image' name hello-kube, with tag 'latest', for simplicity, I do not choose the 'tagname' here, but actually we can set it to 1.0 or whatever version/real product version
  docker save hello-kube:latest | (eval $(minikube docker-env) && docker load) # save to local for minikube to pull, since 'minikube' use different docker env
}

start(){
  kubectl create namespace myserver
  kubectl apply -f deploy.yaml -n myserver
  # kubectl port-forward -n myserver deployment/hello-kube-deployment 8000:8000 # this development will be 'visible' to localhost:8000, but not int the 'cluster'
  # kubectl port-forward -n myserver service/hello-kube-service 8888:8080 # the service makes made our application 'visible' inside cluster
  # now leverage the ingress to make our application 'visible' outside the cluster
  kubectl apply -f ingress.yaml -n myserver
}

stop(){
  kubectl delete -f deploy.yaml -n myserver
  kubectl delete -f ingress.yaml -n myserver
  kubectl delete namespace myserver
}

CMD=$1

case $CMD in
  "build")
    echo "Dockerizing server..."
    build
    ;;

  "start")
    echo "Starting components..."
    start
    ;;

  "stop")
    echo "Stoping components..."
    stop
    ;;

  *)
    echo "unknown command"
    ;;
esac
