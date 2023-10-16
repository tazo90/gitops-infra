kubectl kustomize --enable-helm components/postgres | kubectl apply --filename -

kubectl port-forward svc/postgres-postgresql -n postgres 5450:5432

# Show available databases

SELECT datname FROM pg_catalog.pg_database;