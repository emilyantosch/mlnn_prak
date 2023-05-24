import tensorflow as tf
import numpy as np

params = [-0.000008129409171, 0.000033939014202,
      0.000293485449736,
      -0.001162065703478,
      -0.002913773148158,
      0.010592965256332,
      0.009096671075889,
      -0.027219065764199,
      -0.006468253968319,   
      0.009684123925775]
# Gradient Descent  Optimizer

def fu(x):
    return tf.math.polyval(params, x)

def fu_minimize():
    return tf.math.polyval(params, x)


def reset():
    x = tf.Variable(4.7)
    return x

x = reset()
opt = tf.keras.optimizers.experimental.SGD(learning_rate=0.1, momentum=0.9, nesterov=True, clipnorm=1.0)

for i in range(100):
    print("x: ", x.numpy())
    opt.minimize(fu_minimize, var_list=[x])

