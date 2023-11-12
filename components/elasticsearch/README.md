## Install elasticsearch
kubectl kustomize --enable-helm components/elasticsearch | kubectl apply --filename -

kubectl port-forward svc/elasticsearch 9200:9200
kubectl port-forward svc/elasticsearch 9300:9300

## Test elasticsearch connection
curl elasticsearch-master-hl.elasticsearch.svc:9200
curl <service_name>.<namespace>.svc:<port>

curl elasticsearch-photon-hl.elasticsearch.svc:9200

## External testing
curl localhost:9200

# Commands
- get indexes
curl -X GET "http://localhost:9200/_cat/indices?v"
curl -X GET 'http://localhost:9200/_cat/indices/%2A?v=&s=index:desc'

- get index
curl -XGET http://localhost:9200/_cat/indices/photon_2023-11-10?v=true&s=index

- get shards
curl -XGET localhost:9200/_cat/shards?v

curl -X POST "localhost:9200/_aliases?pretty" -H 'Content-Type: application/json' -d'
{
  "actions": [
    {
      "add": {
        "index": "photon",
        "alias": "my-alias"
      }
    }
  ]
}
'

curl -X DELETE "localhost:9200/my-index-000001?pretty"
