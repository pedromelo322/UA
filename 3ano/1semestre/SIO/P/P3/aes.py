import os
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes





def decript(key, encripted, modo, iv):

    if modo == "CBC":
        cipher = decriptCBC(key, iv)
    elif modo == "ECB":
        cipher = decriptECB(key)
    else:
        cipher = None

    decriptor = cipher.decryptor()
    plainText = decriptor.update(encripted) + decriptor.finalize()
    return plainText

def decriptCBC(key, iv):
    return Cipher(algorithms.AES128(key), modes.CBC(iv))


def decriptECB(key):
    return Cipher(algorithms.AES128(key), modes.ECB())    



def encript(key, plainText, modo, iv):

    if modo == "CBC":
        cipher = encriptCBC(key, iv)
    elif modo == "ECB":
        cipher = encriptECB(key)
    else:
        cipher = None

    encryptor = cipher.encryptor()

    ct = encryptor.update(plainText) + encryptor.finalize()

    return ct


def encriptECB(key):

    return Cipher(algorithms.AES128(key), modes.ECB())

def encriptCBC(key, iv):

    return Cipher(algorithms.AES128(key), modes.CBC(iv))




if __name__ == '__main__':

    iv = os.urandom(16)

    key = os.urandom(16)

    plainText = b'Ola'*16

    encriptado = encript(key,plainText,"CBC", iv)

    print(encriptado)

    print(decript(key, encriptado,"CBC" ,iv))