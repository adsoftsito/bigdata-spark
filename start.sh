#



kubectl exec spark-cluster-master-0 -- rm /tmp/data.json
kubectl exec spark-cluster-worker-0 -- rm /tmp/data.json
kubectl exec spark-cluster-worker-1 -- rm /tmp/data.json

kubectl cp /workspaces/bigdata-spark/code/people.json spark-cluster-master-0:/tmp/data.json
#kubectl cp /workspaces/bigdata-spark/code/people.json spark-cluster-worker-0:/tmp/data.json
#kubectl cp /workspaces/bigdata-spark/code/people.json spark-cluster-worker-1:/tmp/data.json
dfimage ec67ad598863
dfimage -sV=1.36 adsoft/aiops:latest

alias dfimage="docker run -v /var/run/docker.sock:/var/run/docker.sock --rm adsoft/aiops"

kubectl cp /workspaces/bigdata-spark/code/basic.py spark-cluster-master-0:/tmp/program.py
kubectl exec spark-cluster-master-0 -- ls -la /tmp/


kubectl exec -ti --namespace default spark-cluster-master-0 -- spark-submit \
    --master spark://spark-cluster-master-svc:7077 \
    /tmp/program.py
