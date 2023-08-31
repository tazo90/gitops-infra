kubectl kustomize --enable-helm components/directus | kubectl apply --filename -

kubectl port-forward svc/directus -n directus 8055:8055
