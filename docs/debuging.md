https://kubernetes.io/docs/tasks/administer-cluster/dns-debugging-resolution/

kubectl apply -f https://k8s.io/examples/admin/dns/dnsutils.yaml
kubectl exec -it dnsutils -- nslookup kubernetes.default
kubectl exec -it dnsutils -- nslookup postgres-postgresql.postgres.svc
kubectl exec -it dnsutils -- nslookup redis-master.redis.svc

# debug-via-ephemeral-contrainer

https://medium.com/linux-shots/debug-kubernetes-pods-using-ephemeral-container-f01378243ff
