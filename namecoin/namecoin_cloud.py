#!/usr/bin/python3
print("content-type: text/html")
print()

import cgi
import os
import tensorflow as tf
import subprocess
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.figure import Figure

import boto3
from botocore.client import Config

ACCESS_KEY_ID= 'AKIAVSCGW3DHQURMEI72'
ACCESS_SECRET_KEY= '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'
BUCKET_NAME= 'flutterbucket12345'

model2=tf.keras.models.load_model("/var/www/cgi-bin/namecoin.h5")
q=cgi.FieldStorage()
days=q.getvalue("x")
days=int(days)


futures=np.loadtxt("/var/www/cgi-bin/need_data_namecoin.txt")
print("no")
future_for_graphs=np.loadtxt("/var/www/cgi-bin/testing_values_namecoin.txt")
futures=futures.reshape(58,30,1)
req_days=futures[:days,:]

prediction=[]
for i in range(1,days):
        t=model2.predict(futures[i-1:i,:])
        prediction.append(t)

prediction=np.array(prediction)
prediction=prediction.reshape(-1,1)
prediction=prediction.reshape(-1,1)
print(prediction.shape)
print(subprocess.getoutput("whoami"))


plt.plot(prediction,color='red',label='Prediction')
#print("done")
plt.plot(future_for_graphs[:days],color='blue',label="Actual Values")

try:
        plt.savefig("namecoin_prediction_graph.PNG")
        print("hello from try")
except:
        print("something is error")
else:

        print("nicely done")

print(prediction)


data=open('/var/www/cgi-bin/namecoin_prediction_graph.PNG','rb')
s3= boto3.resource(
        's3',
        aws_access_key_id=ACCESS_KEY_ID,
        aws_secret_access_key=ACCESS_SECRET_KEY,
        config=Config(signature_version='s3v4')
)

s3.Bucket(BUCKET_NAME).put_object(Key='namecoin_prediction_graph.PNG',Body=data,ACL='public-read')

