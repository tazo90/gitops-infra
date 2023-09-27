https://kubernetes.io/docs/tasks/administer-cluster/dns-debugging-resolution/

kubectl apply -f https://k8s.io/examples/admin/dns/dnsutils.yaml
kubectl exec -it dnsutils -- bash
kubectl exec -it dnsutils -- nslookup kubernetes.default
kubectl exec -it dnsutils -- nslookup postgres-postgresql.postgres.svc
kubectl exec -it dnsutils -- nslookup redis-master.redis.svc

# debug-via-ephemeral-contrainer

https://medium.com/linux-shots/debug-kubernetes-pods-using-ephemeral-container-f01378243ff

# general debug tools db, curl etc
https://www.padok.fr/en/blog/commands-debug-kubernetes

# debug db
kubectl run psql -it --rm --image=postgres:12.3-alpine -i --tty -- bash

psql postgresql://postgres:secure@pass@postgres-postgresql.postgres.svc:5432/nominatim

postgres -h postgres-postgresql.postgres.svc -P 5432 -u postgres -p secure@pass -d nominatim
postgres -h <ip> -P <port> -u <user> -p<password>`


# debug via curl
kubectl run debug --image=curlimages/curl -i --tty -- sh
kubectl exec -i --tty mycurlpod -- sh
kubectl delete pod mycurlpod
curl postgres-postgresql.postgres.svc