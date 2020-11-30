import tensorflow as tf
import cgi
import subprocess
import numpy as np
import matplotlib.pyplot as plt
import subprocess

model2=tf.keras.models.load_model("C:\\Users\\arjun\\Desktop\\litecoin_uni.h5")
days=cgi.FieldStorage("x")
days=int(input("how many days to predict"))
futures=np.loadtxt("C:\\Users\\arjun\\Desktop\\crypto_preprocessing\\need_data.txt")
future_for_graphs=np.loadtxt("C:\\Users\\arjun\\Desktop\\crypto_preprocessing\\testing_values.txt")
futures=futures.reshape(52,90,1)
req_days=futures[:days,:]
print(req_days.shape)

prediction=model2.predict(req_days)
plt.plot(prediction, color='red', label='Prediction')
plt.plot(future_for_graphs[:days],color='blue',label='Actual Values')
plt.title('Litecoin Price Prediction')
plt.legend()
plt.xlabel("Number of days")
plt.ylabel("value in dollars")
plt.savefig("prediction.PNG")


subprocess.getoutput("aws s3 cp prediction.PNG s3://flutterbucket12345 --acl public-read")



