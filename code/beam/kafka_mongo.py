# Import some necessary modules
# pip install kafka-python
# pip install pymongo
# pip install "pymongo[srv]"
from kafka import KafkaConsumer
from pymongo import MongoClient
from pymongo.server_api import ServerApi

import json

uri = "mongodb+srv://adsoft:adsoft-sito@cluster0.kzghgph.mongodb.net/?retryWrites=true&w=majority"

# Create a new client and connect to the server
client = MongoClient(uri, server_api=ServerApi('1'))
# Send a ping to confirm a successful connection
try:
    client.admin.command('ping')
    print("Pinged your deployment. You successfully connected to MongoDB!")
except Exception as e:
    print(e)

# Connect to MongoDB and pizza_data database
try:
   client = MongoClient(uri, server_api=ServerApi('1'))
   client.admin.command('ping')
   print("Pinged your deployment. You successfully connected to MongoDB!")

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
