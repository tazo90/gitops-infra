kubectl kustomize --enable-helm components/rabbitmq | kubectl apply --filename -

# How to install helm chart via kustomize

https://www.youtube.com/watch?v=2GXC8WtpySc

kubectl port-forward --namespace rabbitmq svc/rabbitmq 15672:15672

helm repo add stable https://charts.helm.sh/stable
helm repo add bitnami https://charts.helm.sh/stable
helm repo add ali https://charts.helm.sh/stable

helm repo list
helm search repo rabbitmq
helm pull bitnami/rabbitmq
helm show values bitnami/rabbitmq

helm install -f values.yaml test-rabbitmq bitnami/rabbitmq --namespace rabbit

kubectl get secret --namespace rabbitmq rabbitmq -o jsonpath="{.data.rabbitmq-password}" | base64 --decode
