from PIL import Image
import os
import sys

# Create the "imagens" folder if it doesn't exist
if not os.path.exists("temp"):
    os.makedirs("temp")

# Troca de cores
def trocadecores(fname):
    im = Image.open(fname)
    width, height = im.size
    new_im = Image.new(im.mode, im.size)
    for x in range(width):
        for y in range(height):
            p = im.getpixel((x, y))
            r = p[1]
            g = p[0]
            b = p[2]
            new_im.putpixel((x, y), (r, g, b))
    new_im.save(os.path.join("imagens", fname + "color-change.jpg"))

trocadecores(sys.argv[1])


# Imagem negativa
def imagemnegativa(fname):
    im = Image.open(fname)
    width, height = im.size
    new_im = Image.new(im.mode, im.size)
    for x in range(width):
        for y in range(height):
            p = im.getpixel((x, y))
            r = 255 - p[1]
            g = 255 - p[0]
            b = 255 - p[2]
            new_im.putpixel((x, y), (r, g, b))
    new_im.save(os.path.join("imagens", fname + "negative-color.jpg"))

imagemnegativa(sys.argv[1])


# Imagens com tons de cinza
def pretoebranco(fname):
    im = Image.open(fname)
    gray_im = effect_gray(im)
    gray_im.save(os.path.join("imagens", fname + "-gray.jpg"))

def effect_gray(im):
    width, height = im.size
    new_im = Image.new("L", im.size)
    for x in range(width):
        for y in range(height):
            p = im.getpixel((x, y))
            l = int(p[0] * 0.299 + p[1] * 0.587 + p[2] * 0.144)
            new_im.putpixel((x, y), (l))
    return new_im

pretoebranco(sys.argv[1])


# Aumento da luminosidade da foto
def aumintensidade(fname):
    im = Image.open(fname)
    intense_im = effect_intensity(im, 2)
    intense_im.save(os.path.join("imagens", fname + "-intense.jpg"))

def effect_intensity(im, f):
    new_im = im.convert("YCbCr")
    width, height = im.size
    for x in range(width):
        for y in range(height):
            pixel = new_im.getpixel((x, y))
            py = min(255, int(pixel[0] * f))  # [0] is the Y channel
            new_im.putpixel((x, y), (py, pixel[1], pixel[2]))
    return new_im

aumintensidade(sys.argv[1])


# Diminuição da luminosidade da foto
def dimintensidade(fname):
    im = Image.open(fname)
    intense_im = effect_intensity(im, 0.5)
    intense_im.save(os.path.join("imagens", fname + "-intense.jpg"))

dimintensidade(sys.argv[1])


# Aumento da saturação da foto
def saturação(fname):
    im = Image.open(fname)
    saturation_im = saturation_adjust(im, 150)
    saturation_im.save(os.path.join("imagens", fname + "-saturation.jpg"))

def saturation_adjust(im, f):
    new_im = im.convert("YCbCr")
    width, height = im.size
    for x in range(width):
        for y in range(height):
            p = new_im.getpixel((x, y))
            py = p[0]
            pb = min(255, int((p[1] - 128) * f) + 128)
            pr = min(255, int((p[2] - 128) * f) + 128)
            new_im.putpixel((x, y), (py, pb, pr))
    return new_im

saturação(sys.argv[1])


# Diminuição da saturação da foto
def desaturação(fname):
    im = Image.open(fname)
    saturation_im = saturation_adjust(im, 11)
    saturation_im.save(os.path.join("imagens", fname + "-desaturation.jpg"))

desaturação(sys.argv[1])


# Sépia picture
def sepia(fname):
    im = Image.open(fname)
    width, height = im.size
    new_im = Image.new(im.mode, im.size)
    for x in range(width):
        for y in range(height):
            p = im.getpixel((x, y))
            # Apply the transformation equations
            r = 0.189 * p[0] + 0.769 * p[1] + 0.393 * p[2]
            g = 0.168 * p[0] + 0.686 * p[1] + 0.349 * p[2]
            b = 0.131 * p[0] + 0.534 * p[1] + 0.272 * p[2]
            # Normalize the RGB values to the [0, 255] range
            r = min(max(int(r), 0), 255)
            g = min(max(int(g), 0), 255)
            b = min(max(int(b), 0), 255)
            new_im.putpixel((x, y), (r, g, b))
    new_im.save(os.path.join("imagens", fname + "-sepia.jpg"))

sepia(sys.argv[1])
