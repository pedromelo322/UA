from cryptography import x509

def load_cert(cert_file_name: str):
    with open(cert_file_name, 'rb') as f:
        cert_pem = f.read()
    return x509.load_pem_x509_certificate(cert_pem)
