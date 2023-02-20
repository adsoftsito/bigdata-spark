# Add repo
helm repo add bitnami https://charts.bitnami.com/bitnami

# install
helm install my-release bitnami/spark

# port-forward
kubectl port-forward service/my-release-spark-master-svc 8082:80 
