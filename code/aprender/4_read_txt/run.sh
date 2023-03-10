export APP_NAME=/workspaces/bigdata-spark/code/aprender/4_read_txt/points.py
echo "submitting code : $APP_NAME ..."
kubectl cp "$APP_NAME" my-release-spark-master-0:/tmp/points.py


export DATA_NAME=/workspaces/bigdata-spark/code/aprender/4_read_txt/5000_points.txt
echo "submitting data : $DATA_NAME ..."
kubectl cp "$DATA_NAME" my-release-spark-master-0:/tmp/5000_points.txt
kubectl cp "$DATA_NAME" my-release-spark-worker-0:/tmp/5000_points.txt
kubectl cp "$DATA_NAME" my-release-spark-worker-1:/tmp/5000_points.txt


kubectl exec -ti --namespace default my-release-spark-master-0 -- ls /tmp

kubectl exec -ti --namespace default my-release-spark-master-0 -- spark-submit \
    --master spark://my-release-spark-master-svc:7077 \
    /tmp/points.py
