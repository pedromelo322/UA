import pytest
from subprocess import Popen
from subprocess import PIPE
from server import *

def test_no_args():
    proc = Popen("python server.py ", stdout=PIPE, shell=True)
    
    return_code = proc.wait()

    assert proc.stdout.read().decode("utf-8") == "Usage: server.py <porto>\r\n"

def test_args_different_than_2():
    proc = Popen("python server.py 1234 1 ", stdout=PIPE, shell=True)
    
    return_code = proc.wait()

    assert proc.stdout.read().decode("utf-8") == "Usage: server.py <porto>\r\n"

def test_args_port_String():
    proc = Popen("python server.py abc ", stdout=PIPE, shell=True)
    
    return_code = proc.wait()

    assert proc.stdout.read().decode("utf-8") == "Porto deve ser um inteiro\r\n"

def test_args_port_digit_maior_65535():
    proc = Popen("python server.py 80000 ", stdout=PIPE, shell=True)
    
    return_code = proc.wait()

    assert proc.stdout.read().decode("utf-8") == "Porto deve ser entre 1024 e 65535\r\n"

def test_args_port_digit_menor_1024():
    proc = Popen("python server.py 800 ", stdout=PIPE, shell=True)
    
    return_code = proc.wait()

    assert proc.stdout.read().decode("utf-8") == "Porto deve ser entre 1024 e 65535\r\n"

