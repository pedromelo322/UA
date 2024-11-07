
def encrypt_file(file, public_key, encrypted_file):
    from cryptography.hazmat.primitives import serialization
    from cryptography.hazmat.primitives.asymmetric import rsa
    from cryptography.hazmat.primitives.asymmetric import padding
    from cryptography.hazmat.backends import default_backend

    with open(public_key, "rb") as key_file:
        public_key = serialization.load_pem_public_key(
            key_file.read(),
            backend=default_backend()
        )

    with open(file, "rb") as file:
        data = file.read()

    encrypted_data = public_key.encrypt(
        data,
        padding.PKCS1v15(
            mgf=padding.MGF1(algorithm=hashes.SHA256()),
            algorithm=hashes.SHA256(),
            label=None
        )
        
    )

    with open(encrypted_file, "wb") as file:
        file.write(encrypted_data)

if __name__ == '__main__':
    import sys

    file = sys.argv[1]
    public_key = sys.argv[2]
    encrypted_file = sys.argv[3]

    encrypt_file(file, public_key, encrypted_file)