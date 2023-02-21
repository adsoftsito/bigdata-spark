# Add repo
helm repo add bitnami https://charts.bitnami.com/bitnami

# install
helm install my-release bitnami/spark

# port-forward
kubectl port-forward service/my-release-spark-master-svc 8082:80

# push your work
git status
git add .
git commit -m "some message"
git push origin main

# next steps

visit
https://bitnami.com/stacks/helm
