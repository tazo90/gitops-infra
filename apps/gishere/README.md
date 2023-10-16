## 1. Overview 

## view yaml manifest first
kubectl kustomize --enable-helm overlays/stage

## apply to kubernetes cluster
kubectl kustomize --enable-helm overlays/stage | kubectl apply -f -

--

## 2. Deploy envs

### Stage
kubectl kustomize --enable-helm overlays/stage
kubectl kustomize --enable-helm overlays/stage | kubectl apply -f -

### Prod
kubectl kustomize --enable-helm overlays/prod
kubectl kustomize --enable-helm overlays/prod | kubectl apply -f -
