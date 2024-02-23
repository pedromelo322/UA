import requests
import json

url = "http://127.0.0.1:8080/actions/doLogin"

data = {
    "username": "pedro",
    "password": "pedro"
}

# Envie a solicitação POST com os dados
r = requests.post(url, data=data)

print(r.status_code)
