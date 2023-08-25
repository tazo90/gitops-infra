# Install specific component

kubectl apply -k ./components/argocd

# Access to service via port-forwarding or ingress

kubectl port-forward service/redis 9121:9121