kubectl kustomize --enable-helm components/nominatim | kubectl apply --filename -

kubectl port-forward svc/nominatim -n nominatim 8080:80

# API query
http://localhost:8080/search?q=opole

# UI playground
http://localhost:8080/ui/search.html
