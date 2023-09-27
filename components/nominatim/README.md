kubectl kustomize --enable-helm components/nominatim | kubectl apply --filename -

kubectl port-forward svc/nominatim -n nominatim 8080:80

# API query
curl http://localhost:8080/search.php?q=opole&polygon_geojson=1&format=jsonv2

# UI playground
http://localhost:8080/ui/search.html


https://github.com/robjuz/helm-charts/tree/master/charts/nominatim

# Setup
1. Run step 1 
  - nominatimInitialize.enabled = True in order to create nominatim database and fill database
  - Pod nominatim-init will be completed
2. Run step 2 
  - nominatimInitialize.enabled = False
  - Pod nominatim will be running

# Troubleshots
1. If nominatim does not starts (failed) because of `database nominatim exists`, then manually run `drop nominatim` in psql.