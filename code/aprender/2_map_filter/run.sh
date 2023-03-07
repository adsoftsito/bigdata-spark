export APP_NAME=/workspaces/bigdata-spark/code/aprender/2_map_filter/map_filter.py
echo "submitting : $APP_NAME ..."

kubectl cp "$APP_NAME" my-release-spark-master-0:/tmp/program.py
kubectl exec -ti --namespace default my-release-spark-master-0 -- ls /tmp

kubectl exec -ti --namespace default my-release-spark-master-0 -- spark-submit \
    --master spark://my-release-spark-master-svc:7077 \
    /tmp/program.py
