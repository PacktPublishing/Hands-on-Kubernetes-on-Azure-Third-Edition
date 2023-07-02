## Try these templates out with My K8S Lab

```
export KUBECONFIG=~/.kube/chungguangy-thornton/config
kubectl config get-contexts
kubectl get deployments --all-namespaces -o go-template-file=./go-templates/cpu.limit.go.tpl 
```

[Tutorial](https://blog.dkwr.de/development/kubernetes-go-templates/)

[Redhat tutorial using oc](https://cloud.redhat.com/blog/customizing-oc-output-with-go-templates)
Use below alias as oc should be compatible with kubectl plus a bit more.
```apache
alias oc=kubectl
oc get pods -o go-template='Hello, World!{{"\n"}}'
oc get pods -o go-template='{{.apiVersion}}{{"\n"}}'
oc get pods -o go-template='{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}'
kubectl get pod -o  go-template-file=./go-templates/pod.modular.go.tpl 
```
