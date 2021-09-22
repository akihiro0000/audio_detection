import urllib.request
import json

url = 'http://172.17.0.1:8000/audio'

try:
    with urllib.request.urlopen(url) as response:
        body = json.loads(response.read())
        print(body.encode("latin-1"))
