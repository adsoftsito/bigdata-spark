import apache_beam as beam
import apache_beam.transforms.window as window
from apache_beam.options.pipeline_options import PipelineOptions
from apache_beam.io.external.kafka import ReadFromKafka, WriteToKafka

kafka_bootstrap = 'localhost:9092'

def run_pipeline():
  with beam.Pipeline(options=PipelineOptions()) as p:
    (p
     | 'Read from Kafka' >> ReadFromKafka(consumer_config={'bootstrap.servers': kafka_bootstrap,
                                                           'auto.offset.reset': 'latest'},
                                          topics=['demo'])

#     | 'Read from Kafka' >> ReadFromKafka(cluster='localhost:9092',topic='demo')
     | 'Par with 1' >> beam.Map(lambda word: (word, 1))
     | 'Window of 10 seconds' >> beam.WindowInto(window.FixedWindows(10))
     | 'Group by key' >> beam.GroupByKey()
     | 'Sum word counts' >> beam.Map(lambda kv: (kv[0], sum(kv[1])))
     | 'Write to Kafka' >> WriteToKafka(producer_config={'bootstrap.servers': kafka_bootstrap},
                                        topic='demo-output')
    )

if __name__ == '__main__':
  run_pipeline()

#bin/kafka-topics.sh --create  --topic demo --bootstrap-server localhost:9092
#bin/kafka-topics.sh --create  --topic demo-output --bootstrap-server localhost:9092
#bin/kafka-console-producer.sh --topic demo --bootstrap-server localhost:9092
#bin/kafka-console-consumer.sh --topic demo --from-beginning --bootstrap-server localhost:9092
