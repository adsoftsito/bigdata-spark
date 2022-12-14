 kubectl run spark-base --rm -it --labels="app=spark-client" \
    --image bde2020/spark-base:3.1.1-hadoop3.2 -- bash ./spark/bin/spark-submit \
    --master spark://spark-master:7077 \
    --conf spark.driver.host=spark-client \
    --class org.apache.spark.examples.SparkPi \
    https://github.com/adsoftsito/bigdata-spark/raw/main/spark/examples/jars/spark-examples_2.12-3.3.1.jar
