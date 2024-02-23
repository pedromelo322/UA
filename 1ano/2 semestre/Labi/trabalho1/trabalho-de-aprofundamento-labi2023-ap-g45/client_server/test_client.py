import pytest
from subprocess import Popen
from subprocess import PIPE

proc = Popen("python server.py 1234", stdout=PIPE, shell=True)


def test_one_arg():
    proc = Popen("python client.py User", stdout=PIPE, shell=True)
    
    return_code = proc.wait()

    assert proc.stdout.readline().decode("utf-8") == "Usage: client.py <client_id> <porto> <[maquina]>\r\n"

def test_two_args():
    proc = Popen("python client.py User 1234", stdout=PIPE, shell=True)
    
    return_code = proc.wait()

    assert proc.stdout.readline().decode("utf-8") == "Conexao bem-sucedida!\r\n"

def test_two_args_port_string():
    proc = Popen("python client.py User labi", stdout=PIPE, shell=True)

    return_code = proc.wait()

    assert proc.stdout.readline().decode("utf-8") == "Porto deve ser um inteiro\r\n"

def test_two_args_port_digit_maior_65535():
    proc = Popen("python client.py User 80000", stdout=PIPE, shell=True)

    return_code = proc.wait()

    assert proc.stdout.readline().decode("utf-8") == "Porto deve ser entre 1024 e 65535\r\n"

def test_two_args_port_digit_menor_1024():
    proc = Popen("python client.py User 800", stdout=PIPE, shell=True)

    return_code = proc.wait()

    assert proc.stdout.readline().decode("utf-8") == "Porto deve ser entre 1024 e 65535\r\n"

def test_two_args_port_digit_entre_1024_65535():
    proc = Popen("python client.py User 1234", stdout=PIPE, shell=True)

    return_code = proc.wait()

    assert proc.stdout.readline().decode("utf-8") == "Conexao bem-sucedida!\r\n"

def test_three_args_maquina_string():
    proc = Popen("python client.py User 1234 labi", stdout=PIPE, shell=True)

    return_code = proc.wait()

    assert proc.stdout.readline().decode("utf-8") == "Maquina deve ser do tipo IPv4(X.X.X.X)\r\n"


def test_thre_args_maquina_maior_255():
    proc = Popen("python client.py User 1234 256.0.0.0", stdout=PIPE, shell=True)

    return_code = proc.wait()

    assert proc.stdout.readline().decode("utf-8") == "Maquina formato IPv4(X.X.X.X) com x entre 0 e 255\r\n"

def test_three_args_maquina_IPv4():
    proc = Popen("python client.py User 1234 127.0.0.1", stdout=PIPE, shell=True)

    return_code = proc.wait()

    assert proc.stdout.readline().decode("utf-8") == "Conexao bem-sucedida!\r\n"


def test_four_args():
    proc = Popen("python client.py User 1234 labi 1234", stdout=PIPE, shell=True)

    return_code = proc.wait()

    assert proc.stdout.readline().decode("utf-8") == "Usage: client.py <client_id> <porto> <[maquina]>\r\n"
