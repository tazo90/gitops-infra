## Install elasticsearch
kubectl kustomize --enable-helm components/elasticsearch | kubectl apply --filename -

## Test elasticsearch connection
curl elasticsearch-master-hl.elasticsearch.svc:9200
curl <service_name>.<namespace>.svc:<port>

curl elasticsearch-photon-hl.elasticsearch.svc:9200