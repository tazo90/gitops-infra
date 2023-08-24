https://www.youtube.com/watch?v=c4v7wGqKcEY
https://argo-cd.readthedocs.io/en/stable/getting_started/

TOOLS:

- kind, argocd, kustomize, helm

# 1. Install kind to create k8s cluster

scoop install kind
scoop install argocd

# 2. Create new k8s cluster

kind create cluster --name argocd

# 3. Check cluster info

kubectl cluster-info --context kind-argocd

# 4. Create namespace

kubectl create namespace argocd

# 5. Install ArgoCD

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.8.0/manifests/install.yaml

# 6. Show all resources of argocd

kubectl get all -n argocd

# 7. Expose access to argocd server

kubectl port-forward svc/argocd-server -n argocd 8080:443

# 8. Run argocd in browser

http://localhost:8080

# 9. Show secret to check password

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
argocd admin initial-password -n argocd
b6yFHTl5lJkXo0cZ

# 10. Change password

argocd login localhost:8080
argocd account update-password

username: admin
password: Foobar90

# 11. Create project

argocd app create react-app --repo https://github.com/anais-codefresh/react-article-display.git --path deploy/helm --dest-server https://kubernetes.default.svc --dest-namespace default

# 12. Sync app

argocd app sync react-app

# 13. App details

argocd app get react-app

# 14. Access to the app

kubectl port-forward service/react-app-example-chart 8000:80
