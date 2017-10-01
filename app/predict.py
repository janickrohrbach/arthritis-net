# import numpy for arrays
import numpy as np
# import matplotlib
import matplotlib.pyplot as plt
# os to handle pathnames
import os.path
# PIL to open & manipulate images
from PIL import Image
from PIL import ImageChops
from PIL import ImageOps
from PIL import ImageFile

# import keras modules from tensorflow.contrib for the CNN
from tensorflow.contrib.keras.python.keras import models

# desired image size
size = (256, 256)
# specify filepath of images
root = "/Users/janickrohrbach"
dirname = "Downloads"

def preprocess_img(file_name):
    # at least one file is damaged, this setting allows
    # to import it anyways
    ImageFile.LOAD_TRUNCATED_IMAGES = True

    # filename
    file = file_name + ".jpg"

    # read image
    image = Image.open(fp=os.path.join(root, dirname, file))
    # some images are read as rgb -> convert to grayscale
    if (image.mode != 0):
        image = image.convert(mode='L')
    # scaling image to desired resultion while keeping aspect ratio
    image.thumbnail(size=size, resample=Image.ANTIALIAS)
    image_size = image.size
    # histogram normalization (remaps the image -> lightest pixel = 255, darkest pixel = 0)
    image = ImageOps.autocontrast(image=image)
    # add a black bar to the image to get desired size
    thumb = image.crop(box=(0, 0, size[0], size[1]))
    # shift original image to the middle so that the black bars are on both sides
    offset_x = max((size[0] - image_size[0]) / 2, 0)
    offset_y = max((size[1] - image_size[1]) / 2, 0)
    thumb = ImageChops.offset(image=thumb, xoffset=int(offset_x),
                              yoffset=int(offset_y))
    # turn into np array
    data = np.asarray(a=thumb, dtype="uint8")
    data = data.reshape(1, 256, 256, 1)
    return (data)

model = models.load_model(filepath="/Users/janickrohrbach/Desktop"
                                   "/dl_project_1/app/model/1st_model.h5")

x = preprocess_img("hqdefault")
plt.imshow(X=x.squeeze(), cmap="gray")
plt.show()

a = int(model.predict_classes(x=x))

print(["FOOT_BOTH", "FOOT_LEFT", "FOOT_RIGHT", "HAND_BOTH",
                        "HAND_LEFT", "HAND_RIGHT"][a])