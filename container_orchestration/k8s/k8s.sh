
#All nodes of cluster
kubectl get no -o wide

#All pods on all namspaces
kubectl get po -A -o wide

#All pods on specific namespace
kubectl get po -n kube-system -o wide

#find pods base on labels filtering
kubectl get po -l app=myapp -o wide
kubectl run nginx --image=nginx --labels=app=myapp
kubectl describe po  nginx 
kubectl exec -it nginx -- bash 
kubectl cluster-info
kubectl logs nginx
kubectl api-resources 
kubectl create -f manifest.yml
kubectl apply  -f manifest.yml
kubectl diff   -f manifest.yml
kubectl replace   -f manifest.yml
kubectl delete   -f manifest.yml
kubectl apply  -f manifest.yml --dry-run=server 