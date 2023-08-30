https://kind.sigs.k8s.io/docs/user/ingress/

scoop install kind

kind create cluster --name ingress

kind delete cluster --name ingress

# Cluster setup with ingress

cat <<EOF | kind create cluster --name ingress --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:

- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
    kubeletExtraArgs:
    node-labels: "ingress-ready=true"
    extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP
    EOF
