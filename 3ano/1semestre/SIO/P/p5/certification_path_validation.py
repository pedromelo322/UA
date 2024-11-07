import argparse
import requests
import base64
from typing import List

from trusted_certificates import trusted
from certification_path import build_cert_path, get_issuer_cert
from utils import load_cert

from cryptography import exceptions, x509
from cryptography.x509 import oid, ocsp
from cryptography.hazmat.primitives import serialization, hashes


def revoked(cert: x509.Certificate) -> bool:
    """This function verifies if the given certificate is revoked or not, by using OCSP by default, or CRL if OCSP fails
    
    Some helpful links:
        - Get certificate extensions: https://cryptography.io/en/latest/x509/reference/#cryptography.x509.Extensions.get_extension_for_class
        - CRL Distribution Points extension: https://cryptography.io/en/latest/x509/reference/#cryptography.x509.CRLDistributionPoints
        - Authority Information Access extension (where the OCSP is): https://cryptography.io/en/latest/x509/reference/#cryptography.x509.AuthorityInformationAccess
        - OCSP-related methods: https://cryptography.io/en/latest/x509/ocsp/
        - OCSP RFC with information on how to build the OCSP request: https://datatracker.ietf.org/doc/html/rfc6960#appendix-A

    Args:
        cert (x509.Certificate): the certificate to verify if it was revoked

    Returns:
        bool: True if the certificate is revoked, False otherwise
    """

    try:
        ...
        # Code with the necessary logic for making the OCSP request
    except x509.ExtensionNotFound:
        # Code with the necessary logic to obtain the CRL and verify if the certificate is in the list
        ...

    return False

def valid_signature(cert: x509.Certificate, issuer: x509.Certificate) -> bool:
    """This function will validate the certificate's signature, according to the issuer's certificate public key
    
    Some helpful links:
        - Information on how to verify the signature: https://cryptography.io/en/latest/x509/reference/#cryptography.x509.Certificate.tbs_certificate_bytes

    Args:
        cert (x509.Certificate): certificate to validate
        issuer (x509.Certificate): issuer's certificate

    Returns:
        bool: True if the signature is valid, False otherwise
    """
    
    # Code with the necessary logic
    
    return True

def is_cert_trusted(cert: x509.Certificate, trusted_certs: dict) -> bool:
    """This function will verify if the given certificate is trusted, according to the trusted certificates

    Args:
        cert (x509.Certificate): certificate to validate
        trusted_certs (dict): dictionary with the trusted certificates

    Returns:
        bool: True if the certificate is trusted, False otherwise
    """
    
    # Code with the necessary logic
    
    return True

def verify_ca_constraint(cert: x509.Certificate) -> bool:
    """This function will verify if the given certificate's belongs to a certificate authority

    Args:
        cert (x509.Certificate): certificate to validate

    Returns:
        bool: True if the certificate belongs to a CA, False otherwise
    """
    
    # Code with the necessary logic
    
    return True

def validate_chain(chain: List[x509.Certificate]) -> bool:
    # First, lets verify if we trust the last certificate in the chain
    if not is_cert_trusted(chain[-1], trusted('/etc/ssl/certs')):
        return False

    # Then, we validate the chain itself.
    # This for will iterate for 1 more item than the length of the chain.
    # That is because one of the cycles will be used to verify the root certificate, if there is one.
    for i in range(len(chain), 0, -1):
        # Verify if we are dealing with the root certificate, if there is one
        if i == len(chain):
            if chain[i - 1] == chain[i - 1]:
                subject, issuer = chain[i - 1], chain[i - 1]
            else:
                continue
        else:
            subject, issuer = chain[i - 1], chain[i]

        if not (i == 1 or verify_ca_constraint(subject)) or not valid_signature(subject, issuer) or not (issuer == subject or not revoked(subject)):
            return False

    return True


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--certificate-file", "-f", required=True, help="File name of the certificate to validate")
    args = parser.parse_args()

    cert = load_cert(args.certificate_file)

    chain = build_cert_path(cert)
    if validate_chain(chain):
        print("The given certificate belongs to a valid chain")
    else:
        print("The given certificate does not belong to a valid chain")
            

if __name__ == "__main__":
    main()
