# Import some necessary modules
# pip install kafka-python
# pip install pymongo
from kafka import KafkaConsumer
from pymongo import MongoClient
import json

# Connect to MongoDB and pizza_data database
try:
   client = MongoClient('localhost',27017)
   db = client.memes
   print("MongoDB Connected successfully!")
except:
   print("Could not connect to MongoDB")

consumer = KafkaConsumer('demo',bootstrap_servers=['localhost:9092'])
# Parse received data from Kafka
for msg in consumer:
    record = json.loads(msg.value)
    print(record)
    name = record['name']

    # Create dictionary and ingest data into MongoDB
    try:
       meme_rec = {'name':name }
       meme_id = db.memes_info.insert_one(meme_rec)
       print("Data inserted with record ids", meme_id)
    except:
       print("Could not insert into MongoDB")
