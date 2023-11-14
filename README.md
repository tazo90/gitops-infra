# Install specific component

kubectl apply -k ./components/argocd

# Access to service via port-forwarding or ingress

kubectl port-forward service/redis 9121:9121

# View manifests before deployment
kubectl kustomize --enable-helm apps/gishere/overlays/prod

# Deployment shared infrastructure
kubectl kustomize --enable-helm infrastructure | kubectl apply -f -

# Deployment specific environments
kubectl kustomize --enable-helm apps/gishere/overlays/stage | kubectl apply -f -
kubectl kustomize --enable-helm apps/gishere/overlays/prod | kubectl apply -f -
