import argparse
import requests
from typing import List

from utils import load_cert
from trusted_certificates import trusted

from cryptography import x509
from cryptography.x509 import oid


def get_issuer_cert(cert: x509.Certificate) -> x509.Certificate:
    """This function obtains the issuer's certificate from the URL value under the CA Issuers field in the Authority Information Access extension
    
    Some helpful links:
        - Get certificate extensions: https://cryptography.io/en/latest/x509/reference/#cryptography.x509.Extensions.get_extension_for_class
        - Authority Information Access extension: https://cryptography.io/en/latest/x509/reference/#cryptography.x509.AuthorityInformationAccess
        - How to load certificates: https://cryptography.io/en/latest/x509/reference/#loading-certificates

    Args:
        cert (x509.Certificate): certificate from which we want to obtain the issuer's certificate

    Returns:
        x509.Certificate: issuer's certificate
    """
    
    # Code with the necessary logic
    
    ...


def build_cert_path(cert: x509.Certificate, trusted_path: str = "/etc/ssl/certs") -> List[x509.Certificate]:
    """This function builds the certification path from a given certificate, returning it as a list

    Args:
        cert (x509.Certificate): the initial certificate in the path
        trusted_path (str, optional): The path to the folder containing the trusted certificates. Defaults to "/etc/ssl/certs".

    Returns:
        List[x509.Certificate]: List of ordered certificates in the chain
    """
    # The list will begin the the given certificate
    result = [cert]

    # From the previous exercise
    trusted_certs = trusted(trusted_path)

    # Code with the necessary logic

    current_cert = cert
    while current_cert.issuer != current_cert.subject:
        if current_cert.issuer in trusted_certs:
            result.append(trusted_certs[current_cert.issuer])
            break
        current_cert = get_issuer_cert(current_cert)
        result.append(current_cert)

    return result


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--certificate-file", "-f", required=True, help="File name of the certificate to validate")
    args = parser.parse_args()
    
    cert = load_cert(args.certificate_file)
    
    print(f"Built chain: {build_cert_path(cert)}")
    

if __name__ == "__main__":
    main()
