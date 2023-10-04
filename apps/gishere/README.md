# Deploy dev env

## view yaml manifest first

kubectl kustomize --enable-helm overlays/stage

## apply to kubernetes cluster

kubectl kustomize --enable-helm overlays/stage | kubectl apply -f -
