from flask import Flask,request


from confluent_kafka import Producer
import socket
import random

topic_name='captured_data'


conf = {'bootstrap.servers': 'pkc-abcd85.us-west-2.aws.confluent.cloud:9092',
        'security.protocol': 'SASL_SSL',
        'sasl.mechanism': 'PLAIN',
        'sasl.username': 'V6WGH4DZCKC2GVA2',
        'sasl.password': 'c86O3OXHz07d2QppToyG0bdOBc7I5j3i3fUnvKAisEI6Gj6jZjgwCwj6er3f2jpT',
        'client.id': socket.gethostname()}

producer = Producer(conf)

app=Flask(__name__)

@app.route('/')
def hello_world():
    return "Hello World"

@app.route('/publish_data',methods=['POST'])
def messagepasser():
    try:
        message=request.json
        print("Input Message : ",message)
        print("Sending kafka message")
        resp = producer.produce(topic = topic_name, key=random.randint(0, 1000) value=message)
        print(resp)
        print("Sent message to kafka")
        return "Success"
    except:
        return "Error"

if __name__=='__main__':
    app.run(host='0.0.0.0',port=50000)
