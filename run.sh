#kubectl port-forward service/spark-cluster-master-svc 8080:80
#kubectl port-forward pod/spark-cluster-master-0 8081:8080
#kubectl port-forward pod/spark-cluster-worker-0 8082:8080

kubectl cp /workspaces/bigdata-spark/code/basic.py spark-cluster-master-0:/tmp/program.py
kubectl cp /workspaces/bigdata-spark/code/people.json spark-cluster-master-0:/opt/bitnami/spark/data.json
kubectl cp /workspaces/bigdata-spark/code/people.json spark-cluster-worker-0:/opt/bitnami/spark/data.json
kubectl cp /workspaces/bigdata-spark/code/people.json spark-cluster-worker-1:/opt/bitnami/spark/data.json

kubectl exec -ti --namespace default spark-cluster-master-0 -- ls /opt/bitnami/spark/data
kubectl exec -ti --namespace default spark-cluster-master-0 -- cat /opt/bitnami/spark/data.json

kubectl exec -ti --namespace default spark-cluster-master-0 -- spark-submit \
    --master spark://spark-cluster-master-svc:7077 \
    /tmp/program.py

./bin/spark-submit \
    --class org.apache.spark.examples.SparkPi \
    --conf spark.kubernetes.container.image=bitnami/spark:3 \
    --master k8s://http://service/kubernetes:443 \
    --conf spark.kubernetes.driverEnv.SPARK_MASTER_URL=spark://spark-cluster-master-svc:707 \
    --deploy-mode cluster \
    ./examples/jars/spark-examples_2.12-3.2.0.jar 1000


./bin/spark-submit \
    --conf spark.kubernetes.container.image=bitnami/spark:3 \
    --master k8s://https://https://adsoftsito-phd-humble-robot-qrpr7x5jpvjc4qvj-8001.preview.app.github.dev/:8001 \
    --conf spark.kubernetes.driverEnv.SPARK_MASTER_URL=spark://spark-cluster-master-svc:707 \
    --deploy-mode cluster \
    ../code/pi.py
