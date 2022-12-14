 kubectl run spark-base --rm -it --labels="app=spark-client" \
    --image bde2020/spark-base:3.1.1-hadoop3.2 -- bash ./spark/bin/spark-submit \
    --master spark://spark-master:7077 \
    --conf spark.driver.host=spark-client \
    https://raw.githubusercontent.com/adsoftsito/bigdata-spark/main/spark/examples/src/main/python/pi.py
