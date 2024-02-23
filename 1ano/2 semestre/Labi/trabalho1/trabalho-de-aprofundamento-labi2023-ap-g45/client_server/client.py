#!/usr/bin/python3

import os
import sys
import socket
import json
import base64
from common_comm import send_dict, recv_dict, sendrecv_dict

from Cryptodome.Cipher import AES
from Cryptodome.Hash import SHA256

# Function to encript values for sending in json format
# return int data encrypted in a 16 bytes binary string coded in base64
def encrypt_intvalue (cipherkey, data):
	return None


# Function to decript values received in json format
# return int data decrypted from a 16 bytes binary strings coded in base64
def decrypt_intvalue (cipherkey, data):
	return None


# verify if response from server is valid or is an error message and act accordingly - já está implementada
def validate_response (client_sock, response):
	if not response["status"]:
		print (response["error"])
		client_sock.close ()
		sys.exit (3)


# process QUIT operation
def quit_action (client_sock, attempts):
	send_dict(client_sock, {"op": "QUIT"})
	response = recv_dict(client_sock)
	print(response)
	validate_response(client_sock, response)
	client_sock.close()
	sys.exit(0)


# Outcomming message structure:
# { op = "START", client_id, [cipher] }
# { op = "QUIT" }
# { op = "NUMBER", number }
# { op = "STOP", [shasum] }
# { op = "GUESS", choice }
#
# Incomming message structure:
# { op = "START", status }
# { op = "QUIT" , status }
# { op = "NUMBER", status }
# { op = "STOP", status, value }
# { op = "GUESS", status, result }

#
# Suport for executing the client pretended behaviour
#


def start_action(client_sock, client_id):
	send_dict(client_sock, {"op": "START", "client_id": client_id})
	response = recv_dict(client_sock)
	print(response)
	validate_response(client_sock, response)
	if response["status"]:
		cipher = response.get("cipher")
		return cipher
	return None

def number_action(client_sock, cipher, number):
	if cipher is not None:
		number = encrypt_intvalue(cipher, number)
	send_dict(client_sock, {"op": "NUMBER", "number": number})
	response = recv_dict(client_sock)
	print(response)
	validate_response(client_sock, response)
	return response["status"]

def stop_action(client_sock, cipher):
    if cipher is not None:
        shasum = encrypt_intvalue(cipher)
    send_dict(client_sock, {"op": "STOP"})
    response = recv_dict(client_sock)
    print(response)
    validate_response(client_sock, response)
    return response["status"]

def guess_action(client_sock, cipher, choice):
	if cipher is not None:
		choice = encrypt_intvalue(cipher, choice)
	send_dict(client_sock, {"op": "GUESS", "choice": choice})
	response = recv_dict(client_sock)
	print(response)
	validate_response(client_sock, response)
	return response["status"]


def run_client (client_sock, client_id):
    cipher = None
    while True:
        print ("Select action: ")
        print (" 1 - START")
        print (" 2 - QUIT")
        print (" 3 - NUMBER")
        print (" 4 - STOP")
        print (" 5 - GUESS")
        action = input("Select option: ")
        if action == "1":
            cipher = start_action(client_sock, client_id)
        elif action == "2":
            quit_action(client_sock, 0)
        elif action == "3":
            while True:
                try:
                    number = int(input("Number: "))
                    number_action(client_sock, cipher, number)
                except ValueError:
                      break
            
        elif action == "4":
            stop_action(client_sock, cipher)
        elif action == "5":
            choice = int(input("Choice: "))
            guess_action(client_sock, cipher, choice)
        else:
            print ("Invalid option")
    return None
	

def main():
	# validate the number of arguments and eventually print error message and exit with error
	# verify type of of arguments and eventually print error message and exit with error

	# obtain the port number
	# port = ?

	# obtain the hostname that can be the localhost or another host
	# hostname = ?



    if len(sys.argv) == 3 or len(sys.argv) == 4:
        for e in sys.argv[2]:
            if not e.isdigit():
                print ("Porto deve ser um inteiro".format(sys.argv[0]))
                sys.exit(2)
        if int(sys.argv[2]) < 1024 or int(sys.argv[2]) > 65535:
            print ("Porto deve ser entre 1024 e 65535".format(sys.argv[0]))
            sys.exit(2)
        else:
            port = int(sys.argv[2])


        if len(sys.argv) == 3:
            hostname = "localhost"
        
    
        if len(sys.argv) == 4:
            str = sys.argv[3].split('.')
            for e in str:
                if not e.isdigit():
                    print ("Maquina deve ser do tipo IPv4(X.X.X.X)".format(sys.argv[0]))
                    sys.exit(2)
                elif int(e) < 0 or int(e) > 255:
                    print ("Maquina formato IPv4(X.X.X.X) com x entre 0 e 255".format(sys.argv[0]))
                    sys.exit(2)
                else:
                    hostname = sys.argv[3]

    else:
        print ("Usage: {} <client_id> <porto> <[maquina]>".format(sys.argv[0]))
        sys.exit(2)
          

    client_socket = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
    client_socket.bind(("0.0.0.0", 0))
    client_socket.connect ((hostname, port))
    print("Conexao bem-sucedida!")


    run_client (client_socket, sys.argv[1])

    client_socket.close ()
    sys.exit(0)

if __name__ == "__main__":
    main()