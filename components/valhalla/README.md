kubectl kustomize --enable-helm components/valhalla | kubectl apply --filename -

kubectl port-forward svc/valhalla -n valhalla 8055:8055
