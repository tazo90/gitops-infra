https://segmentfault.com/a/1190000040278467/en

helm repo add stable https://charts.helm.sh/stable
helm repo add bitnami https://charts.helm.sh/stable
helm repo add ali https://charts.helm.sh/stable

helm repo list
helm search repo rabbitmq
helm pull bitnami/rabbitmq
helm show values bitnami/rabbitmq

helm install -f values.yaml test-rabbitmq bitnami/rabbitmq --namespace rabbit

helm create chart-name

cd /c/dev/gitops/gitops-demo/components/directus/charts/directus
helm install -f values.yaml directus .


helm install postgresql3 bitnami/postgresql -f values.yaml
kubectl logs -f postgresql3-0