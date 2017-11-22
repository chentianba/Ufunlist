# from matplotlib import image

# im = image.imread('media/warning.jpg')
# print(im.shape)

from PIL import Image
img = Image.open('media/warning.jpg')
print(img.size)