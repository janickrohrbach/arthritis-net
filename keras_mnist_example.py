# import tf
import tensorflow as tf
import numpy as np

# import mnist dataset
from keras.datasets import mnist

# keras imports
from tensorflow.contrib.keras.python.keras.models import Sequential
from tensorflow.contrib.keras.python.keras.layers import Dense, Dropout, \
    Flatten, Activation
from tensorflow.contrib.keras.python.keras.layers.convolutional import \
    Conv2D, MaxPooling2D
from tensorflow.contrib.keras.python.keras.utils import np_utils
from tensorflow.contrib.keras.python.keras import backend as K
from tensorflow.contrib.keras.python.keras import callbacks
from tensorflow.contrib.keras.python.keras.layers.normalization import \
    BatchNormalization

# import matplotlib
import matplotlib.pyplot as plt

# image format -> (rows, cols, channels)
K.set_image_data_format("channels_last")

# fix random seed for reproducibility
seed = 1
np.random.seed(seed)
tf.set_random_seed(seed)

# load data
(img_train, labels_train), (img_test, labels_test) = mnist.load_data()
# plt.imshow(img_train[0], cmap=plt.get_cmap('gray'))
# reshape to be [samples][width][height][pixels]
img_train = img_train.reshape(img_train.shape[0], 28, 28, 1).astype('float32')
img_test = img_test.reshape(img_test.shape[0], 28, 28, 1).astype('float32')

# normalize inputs from 0-255 to 0-1
img_train = img_train / 255
img_test = img_test / 255

# one hot encode outputs
labels_train = np_utils.to_categorical(labels_train)
labels_test = np_utils.to_categorical(labels_test)
num_classes = labels_test.shape[1]

def conv_model():

    # create model
    model = Sequential()
    model.add(Conv2D(filters=30, kernel_size=(5, 5), input_shape=(28, 28, 1),
                     activation="relu", kernel_initializer="he_normal"))
    model.add(MaxPooling2D(pool_size=(2, 2)))
    model.add(Conv2D(filters=15, kernel_size=(3, 3), activation="relu"))
    model.add(MaxPooling2D(pool_size=(2, 2)))
    model.add(Flatten())
    model.add(Dense(units=128, kernel_initializer="he_normal",
                    activation="relu"))
    model.add(Dropout(rate=0.2))
    model.add(Dense(units=50, kernel_initializer="he_normal",
                    activation="relu"))
    model.add(Dense(units=num_classes, activation="softmax",
                    kernel_initializer="he_normal"))

    # Compile model
    model.compile(optimizer="adam", loss="categorical_crossentropy",
                    metrics=["accuracy"])

    return model

# build the model
model = conv_model()

# tensorboard callback
tb_callback = callbacks.TensorBoard(log_dir="./tensorboard/base_model",
                                    histogram_freq=0,
                                     write_graph=True, write_images=True)

# terminal:
# tensorboard --logdir=/Users/janickrohrbach/Desktop/dl_project_1/tensorboard

# Fit the model
model.fit(x=img_train, y=labels_train, batch_size=200, epochs=15, verbose=2,
          callbacks=[tb_callback], validation_data=(img_test, labels_test))


# Final evaluation of the model
scores = model.evaluate(img_test, labels_test, verbose=0)
print("Error: %.2f%%" % (100 - scores[1]*100))