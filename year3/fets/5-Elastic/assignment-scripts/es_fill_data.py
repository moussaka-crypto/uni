

from urllib.request import urlopen, Request
import json
import pprint
import lorem

req = Request('http://localhost:9200/lorem',
    json.dumps(
    {
            "index" : {
                "number_of_shards" : 2
            }
    } ).encode("ascii"),
    headers = { "Content-Type": "application/json" },
    method = 'PUT' )

with urlopen(req) as response:
    result = json.load( response )
    pprint.pprint(result)

req = Request('http://localhost:9200/lorem/_settings',
    json.dumps(
    {
        "index" : {
            "number_of_replicas" : 1
        }
    } ).encode("ascii"),
    headers = { "Content-Type": "application/json" },
    method = 'PUT'
    )

with urlopen(req) as response:
    result = json.load( response )
    pprint.pprint(result)

with urlopen('http://localhost:9200/lorem/_settings?pretty') as response:
    result = json.load( response )
    pprint.pprint(result)

for i in range(10000):
  data = { "mein_text": lorem.sentence() , "key2": i }
  data = json.dumps(data).encode("ascii")
  req = Request('http://localhost:9200/lorem/_doc/%s' % str(i) ,
          data,  { "Content-Type": "application/json" } , method = 'PUT')
  with urlopen(req) as response:
      result = json.load( response )
      pprint.pprint(result)
