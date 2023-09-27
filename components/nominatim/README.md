kubectl kustomize --enable-helm components/nominatim | kubectl apply --filename -

kubectl port-forward svc/nominatim -n nominatim 8080:80

# API query
curl http://localhost:8080/search.php?q=opole&polygon_geojson=1&format=jsonv2

# UI playground
http://localhost:8080/ui/search.html


https://github.com/robjuz/helm-charts/tree/master/charts/nominatim

# Setup
1. First run should set nominatimInitialize.enabled = True in order to create nominatim database

# Troubleshots
1. If nominatim fails when running because of `database nominatim exists`, then manually run `drop nominatim` in psql.