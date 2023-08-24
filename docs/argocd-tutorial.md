https://www.youtube.com/watch?v=JLrR9RV9AFA
https://www.youtube.com/watch?v=spCdNeNCuFU
https://github.com/devopsjourney1/argo-examples

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

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# 6. Access to argocd server

kubectl port-forward service/argocd-server -n argocd 8080:443

# 7. Check dev deployment

kubectl get all -n dev

# 8. Run application

kubectl port-forward services/myhelmapp 8888:80 -n dev
