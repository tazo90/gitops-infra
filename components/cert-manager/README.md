## Installation

https://www.youtube.com/watch?v=hoLUigg4V18

```
1. Install cert-manager
  k apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.9.1/cert-manager.yaml

2. Create cert-manager-test namespace
  k create ns cert-manager-test

3. Create issuer
  k apply -f issuer.yaml

4. Create certificate selfsigned or by letsencrypt
  k apply -f certificate

5. Check if certificate is created
  k describe certificate -n cert-manager

6. View certificate stored in secret
  k get secrets -n cert-manager

7. Show cert issuer
  k get issuer -n cert-manager
```

## Troubelshots

1. Cannot create issuer and cert

https://stackoverflow.com/questions/72059332/how-can-i-fix-failed-calling-webhook-webhook-cert-manager-io

https://cert-manager.io/v1.2-docs/installation/uninstall/kubernetes/

```
validatingwebhookconfiguration.zation.k8s.io/cert-manager-controller-ingress-shiadmissionregistration.k8s.io/cert-manager-webhook configured
Error from server (InternalError): error when creating "components/cert-manager": Internal error occurred: failed calling webhook "webhook.cert-manager.io": failed to call webhook: Post "https://cert-manager-webhook.cert-manager.svc:443/mutate?timeout=10s": dial tcp 10.96.214.4:443: connect: connection
```

After you apply cert-manager you can get this error.
You need to remove fully cert-manager namespace and all configuration related to cert-manager.

k delete namepsace cert-manager
k delete -f https://github.com/cert-manager/cert-manager/releases/download/v1.9.1/cert-manager.yaml

Now you will be able to install successfully cert.

k apply -k components/cert-manager