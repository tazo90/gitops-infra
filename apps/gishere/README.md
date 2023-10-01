# Deploy dev env

## view yaml manifest first

kubectl kustomize --enable-helm overlays/dev

## apply to kubernetes cluster

kubectl kustomize --enable-helm overlays/dev | kubectl apply -f -
