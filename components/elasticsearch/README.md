## Install elasticsearch
kubectl kustomize --enable-helm components/elasticsearch | kubectl apply --filename -

kubectl port-forward svc/elasticsearch -n elasticsearch 9200:9200

## Test elasticsearch connection
curl elasticsearch-master-hl.elasticsearch.svc:9200
curl <service_name>.<namespace>.svc:<port>

curl elasticsearch-photon-hl.elasticsearch.svc:9200

## External testing
curl localhost:9200
