export APP_NAME=/workspaces/bigdata-spark/code/aprender/3_read_csv/people.py
echo "submitting code : $APP_NAME ..."

kubectl cp "$APP_NAME" my-release-spark-master-0:/tmp/people.py

export DATA_NAME=/workspaces/bigdata-spark/code/aprender/3_read_csv/people.csv
echo "submitting data : $DATA_NAME ..."

kubectl cp "$DATA_NAME" my-release-spark-master-0:/tmp/people.csv
kubectl cp "$DATA_NAME" my-release-spark-worker-0:/tmp/people.csv
kubectl cp "$DATA_NAME" my-release-spark-worker-1:/tmp/people.csv


kubectl exec -ti --namespace default my-release-spark-master-0 -- ls /tmp

kubectl exec -ti --namespace default my-release-spark-master-0 -- spark-submit \
    --master spark://my-release-spark-master-svc:7077 \
    /tmp/people.py
