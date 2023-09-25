kubectl kustomize --enable-helm components/postgres | kubectl apply --filename -

# Show available databases

SELECT datname FROM pg_catalog.pg_database;