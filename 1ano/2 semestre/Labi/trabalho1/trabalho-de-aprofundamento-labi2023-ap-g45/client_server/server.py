#!/usr/bin/python3

import sys
import socket
import select
import json
import base64
import csv
import random
from common_comm import send_dict, recv_dict, sendrecv_dict

from Cryptodome.Cipher import AES
from Cryptodome.Hash import SHA256

# Dicionário com a informação relativa aos clientes
users = {}

# return the client_id of a socket or None
def find_client_id(client_sock):
    for client_id in users:
        if users[client_id]["socket"] == client_sock:
            return client_id
    return None

# Função para encriptar valores a enviar em formato json com codificação base64
# return int data encrypted in a 16 bytes binary string and coded base64

def encrypt_intvalue (client_id, data):
    data = users[client_id]["cipher"].encrypt (bytes("%16d" % (data), "utf8"))
    data_tosend = str (base64.b64encode (data), "utf8")

    return data_tosend

# Função para desencriptar valores recebidos em formato json com codificação base64
# return int data decrypted from a 16 bytes binary string and coded base64
def decrypt_intvalue (client_id, data):

    data = base64.b64decode (data)
    data = users[client_id]["cipher"].decrypt (data)
    data = int (str (data, "utf8"))

    return data

def calcular_sha256(dados):
    string = ""
    for e in dados:
        string += str(e)
    hash = SHA256.new()
    hash.update(str.encode("utf8"))
    return hash.hexdigest()


# Função auxiliar para gerar o resultado - já está implementada
# return int value and list of description strings identifying the characteristic of the value

def generate_result (list_values):
    if len(list_values) % 2 == 1: test = 4
    else : test = 3

    minimal = min(list_values)
    maximal = max(list_values)
    first = list_values[0]
    last = list_values[-1]
		
    choice = random.randint (0, test)
    if choice == 0:
        if minimal == first: return first, ["min", "first"]
        elif maximal == first: return first, ["max", "first"]
        else: return first, ["first"]
    elif choice == 1:
        if minimal == last: return last, ["min", "last"]
        elif maximal == last: return last, ["max", "last"]
        else: return last, ["last"]
    elif choice == 2:
        if minimal == first: return first, ["min", "first"]
        elif minimal == last: return last, ["min", "last"]
        else: return minimal, ["min"]
    elif choice == 3:
        if maximal == first: return first, ["max", "first"]
        elif maximal == last: return last, ["max", "last"]
        else: return maximal, ["max"]
    elif choice == 4:
        list_values.sort()
        median = list_values[len(list_values) // 2]
        if median == first: return first, ["median", "first"]
        elif median == last: return last, ["median", "last"]
        else: return median, ["median"]
    else:
        return None
    
# Incomming message structure:
# { op = "START", client_id, [cipher] }
# { op = "QUIT" }
# { op = "NUMBER", number }
# { op = "STOP", [shasum] }
# { op = "GUESS", choice }
#
# Outcomming message structure:
# { op = "START", status }
# { op = "QUIT" , status }
# { op = "NUMBER", status }
# { op = "STOP", status, value }
# { op = "GUESS", status, result }


#
# Suporte de descodificação da operação pretendida pelo cliente - já está implementada
#

def new_msg (client_sock):
        
    json_request = recv_dict (client_sock)

    request = json.loads(json_request)
        
    print( "Command: %s" % (str(request)) )


    op = request["op"]
    if op == "START":
        response = new_client (client_sock, request)
    elif op == "QUIT": # 
        response = quit_client (client_sock)
    elif op == "NUMBER": # 
        response = number_client (client_sock, request)
    elif op == "STOP": # 
        response = stop_client (client_sock, request)
    elif op == "GUESS": # 
        response = guess_client (client_sock, request)
    else:
        response = { "op": op, "status" : False, "error": "Operação inexistente" }

	# print (response)
    send_dict (client_sock, response )

#
# Suporte da criação de um novo cliente - operação START
#
# detect the client in the request
# verify the appropriate conditions for executing this operation
# process the client in the dictionary
# return response message with or without error message

def new_client (client_sock, request):

    client_id = request["client_id"]
    if client_id in users:
 
        return json.dumps({ "op": "START", "status" : False, "error": "Cliente existente" })
    else:
        if request["cipher"] == None:
            
            users[client_id] = { "socket": client_sock, "cipher": None, "numbers": [] }

            return json.dumps({ "op": "START", "status" : True})
            
        else:
            cipherkey = base64.b64decode (request["cipher"])
            cipher = AES.new (cipherkey, AES.MODE_ECB)
            users[client_id] = { "socket": client_sock, "cipher": cipher, "numbers": [] }
            return json.dumps({ "op": "START", "status" : True})






	
#
# Suporte da eliminação de um cliente - já está implementada
#
# obtain the client_id from his socket and delete from the dictionary

def clean_client (client_sock):
    client_id = find_client_id(client_sock)
    if client_id != None:
        del users[client_id]

#
# Suporte do pedido de desistência de um cliente - operação QUIT
#
# obtain the client_id from his socket
# verify the appropriate conditions for executing this operation
# process the report file with the QUIT result
# eliminate client from dictionary using the function clean_client
# return response message with or without error message
def quit_client (client_sock):
    client_id = find_client_id(client_sock)
    if client_id == None:
        return json.dumps({ "op": "QUIT", "status" : False, "error": "Cliente inexistente" })
    else:
        clean_client(client_sock)
        return json.dumps({ "op": "QUIT", "status" : True })

    
#
# Suporte da criação de um ficheiro csv com o respectivo cabeçalho - já está implementada
#

def create_file ():
	with open("result.csv", "w", newline="") as csvfile:
		columns = ["client_id", "number_of_numbers", "guess"]

		fw = csv.DictWriter (csvfile, delimiter=",", fieldnames=columns)
		fw.writeheader()
                
#
# Suporte da actualização de um ficheiro csv com a informação do cliente
#
# update report csv file with the simulation of the client

def update_file (client_id, number_of_numbers, guess):  
    with open("result.csv", "a", newline="") as csvfile:
        columns = ["client_id", "number_of_numbers", "guess"]

        fw = csv.DictWriter (csvfile, delimiter=",", fieldnames=columns)
        fw.writerow({"client_id": client_id, "number_of_numbers": number_of_numbers, "guess": guess})
    
#
# Suporte do processamento do número de um cliente - operação NUMBER
#
# obtain the client_id from his socket
# verify the appropriate conditions for executing this operation
# return response message with or without error message
def number_client (client_sock, request):
    client_id = find_client_id(client_sock)
    if client_id == None:
        return json.dumps({ "op": "NUMBER", "status" : False, "error": "Cliente inexistente" })
    else:
        number = request["number"]   
        if users[client_id]["cipher"] != None:
            number = decrypt_intvalue(client_id, number)
        
        users[client_id]["numbers"].append(number)
        print(users[client_id]["numbers"])
        return json.dumps({ "op": "NUMBER", "status" : True })
        
#
# Suporte do pedido de terminação de um cliente - operação STOP
#
# obtain the client_id from his socket
# verify the appropriate conditions for executing this operation
# randomly generate a value to return using the function generate_result
# process the report file with the result
# return response message with result or error message

def stop_client (client_sock, request):
    # ...
	# value, solution = generate_result (users[client_id]["numbers"])
	# ...


    client_id = find_client_id(client_sock)
    shasum = calcular_sha256(str(users[client_id]["numbers"]))
    if client_id == None:
        return json.dumps({ "op": "NUMBER", "status" : False, "error": "Cliente inexistente" })
    elif len(users[client_id]["numbers"]) < 1:
        return json.dumps({ "op": "NUMBER", "status" : False, "error": "Não foram introduzidos números" })
        
    else:

        if request["shasum"] != shasum:
            return json.dumps({ "op": "NUMBER", "status" : False, "error": "Síntese inconsistente"})

        value, solution = generate_result (users[client_id]["numbers"])
        users[client_id]["solution"] = solution
        update_file(client_id, len(users[client_id]["numbers"]), solution)
        if users[client_id]["cipher"] != None:
            value = encrypt_intvalue (client_id, value)
        print({"op": "STOP", "status" : True, "value": value , "solution": solution})
        return json.dumps({"op": "STOP", "status" : True, "value": value })



    
#
# Suporte da adivinha de um cliente - operação GUESS
#
# obtain the client_id from his socket
# verify the appropriate conditions for executing this operation
# eliminate client from dictionary
# return response message with result or error message


def guess_client (client_sock, request):

    client_id = find_client_id(client_sock)

    if client_id == None:
        return json.dumps({ "op": "GUESS", "status" : False, "error": "Cliente inexistente" })
    else:
        if "choice" in request:
            guess = request["choice"]
            if guess in users[client_id]["solution"]:
                return json.dumps({ "op": "GUESS", "status" : True, "value": True })
            else:
                return json.dumps({ "op": "GUESS", "status" : True, "value": False })


        
def main():

    # validate the number of arguments and eventually print error message and exit with error
	# verify type of of arguments and eventually print error message and exit with error

	# obtain the port number
	# port = ?
    if len(sys.argv) != 2:
        print ("Usage: {} <porto>".format(sys.argv[0]))
        sys.exit(2)

    if not sys.argv[1].isdigit():
        print ("Porto deve ser um inteiro".format(sys.argv[0]))
        sys.exit(2)

    if int(sys.argv[1]) < 1024 or int(sys.argv[1]) > 65535:
        print ("Porto deve ser entre 1024 e 65535")
        sys.exit(2)

    port = int(sys.argv[1])



    server_socket = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
    server_socket.bind (("127.0.0.1", port))
    server_socket.listen ()

    clients = []
    create_file ()

    while True:
        try:
            available = select.select ([server_socket] + clients, [], [])[0]
        except ValueError:  
            # Sockets may have been closed, check for that
            for client_sock in clients:
                if client_sock.fileno () == -1: client_sock.remove(client) # closed
            continue # Reiterate select

        for client_sock in available:
			# New client?
            if client_sock is server_socket:
                newclient, addr = server_socket.accept ()
                clients.append (newclient)
			# Or an existing client
            else:
				# See if client sent a message
                if len (client_sock.recv (1, socket.MSG_PEEK)) != 0:
					# client socket has a message
					##print ("server" + str (client_sock))
                    new_msg (client_sock)
                else: # Or just disconnected
                    clients.remove (client_sock)
                    clean_client (client_sock)
                    client_sock.close ()
                    break # Reiterate select

if __name__ == "__main__":
	main()

