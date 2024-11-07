import argparse
import datetime
from utils import load_cert
from cryptography import x509


def valid(cert: x509.Certificate) -> bool:
    """This function verifies validity of the certificate given as argument, according to the current date

    Args:
        cert (x509.Certificate): the certificate to validate

    Returns:
        bool: True if the certificate is valid, False otherwise
    """
    
    # Code with the necessary logic

    
    return cert.not_valid_after_utc > datetime.datetime.now(datetime.UTC) and datetime.datetime.now(datetime.UTC) > cert.not_valid_before_utc


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--certificate-file", "-f", required=True, help="File name of the certificate to validate")
    args = parser.parse_args()

    cert = load_cert(args.certificate_file)
    
    print(f"The given certificate was {'valid' if valid(cert) else 'invalid'}")


if __name__ == "__main__":
    main()

