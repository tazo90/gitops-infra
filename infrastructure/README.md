# Deploy infrastructure in cluster

## view yaml manifest first
kubectl kustomize --enable-helm infrastructure

## apply to kubernetes cluster
kubectl kustomize --enable-helm infrastructure | kubectl apply -f -
