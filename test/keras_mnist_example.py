# import tf
import tensorflow as tf
import numpy as np

# import mnist dataset
from keras.datasets import mnist

# keras imports
from tensorflow.contrib.keras.python.keras.models import Sequential
from tensorflow.contrib.keras.python.keras.layers import Dense, Dropout, \
    Flatten
from tensorflow.contrib.keras.python.keras.layers.convolutional import \
    Conv2D, MaxPooling2D
from tensorflow.contrib.keras.python.keras.utils import to_categorical
from tensorflow.contrib.keras.python.keras import backend as K
from tensorflow.contrib.keras.python.keras import callbacks

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
# Converts a class vector (integers) to binary class matrix.
# E.g. for use with categorical_crossentropy.
labels_train = to_categorical(labels_train)
labels_test = to_categorical(labels_test)
num_classes = labels_test.shape[1]


def conv_model():
    # create model
    model = Sequential()
    model.add(Conv2D(filters=32, kernel_size=(3, 3), input_shape=(28, 28, 1),
                     activation="relu", kernel_initializer="he_normal"))
    model.add(Conv2D(filters=32, kernel_size=(3, 3), activation="relu"))
    model.add(MaxPooling2D(pool_size=(2, 2)))
    model.add(Conv2D(filters=64, kernel_size=(3, 3), activation="relu"))
    model.add(Conv2D(filters=64, kernel_size=(3, 3), activation="relu"))
    model.add(MaxPooling2D(pool_size=(2, 2)))
    model.add(Flatten())
    model.add(Dense(units=128, kernel_initializer="he_normal",
                    activation="relu"))
    model.add(Dropout(rate=0.3))
    model.add(Dense(units=128, kernel_initializer="he_normal",
                    activation="relu"))
    model.add(Dense(units=num_classes, activation="softmax",
                    kernel_initializer="he_normal"))

    # Compile model
    model.compile(optimizer="adam", loss="categorical_crossentropy",
                  metrics=["accuracy"])

    return model


# build the model
model = conv_model()
model.summary()

# tensorboard callback
tb_callback = callbacks.TensorBoard(log_dir="./tensorboard/2nd_model",
                                    histogram_freq=0, write_graph=True,
                                    write_images=True)

# terminal:
# tensorboard --logdir=/Users/janickrohrbach/Desktop/dl_project_1
# /test/tensorboard

# Fit the model
model.fit(x=img_train, y=labels_train, batch_size=200, epochs=10, verbose=2,
          callbacks=[tb_callback], validation_data=(img_test, labels_test))

# Final evaluation of the model
scores = model.evaluate(img_test, labels_test, verbose=0)
print("Error: %.2f%%" % (100 - scores[1] * 100))

# Save the model
# serialize model to JSON
model_json = model.to_json()
with open("./models/2nd_model.json", "w") as json_file:
    json_file.write(model_json)
# serialize weights to HDF5
model.save_weights("./models/2nd_model.h5")
print("Saved model to disk")