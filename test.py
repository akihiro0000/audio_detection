import urllib.request
import json

url = 'http://172.17.0.1:8000/audio'

with urllib.request.urlopen(url) as response:
        body = json.loads(response.read())
        print(body["0"].encode("latin-1"))
