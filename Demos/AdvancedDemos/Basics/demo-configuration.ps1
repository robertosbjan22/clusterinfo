# Change to the demo folder
Set-Location Configuration

read-host "Navigate to the Deployments page"

read-host "Next Step - Creates initial configuration and deployment"
kubectl apply -f simple-configmap.yaml
kubectl apply -f simple-configmap2.yaml
kubectl apply -f simple-secret.yaml
kubectl apply -f simple-secret2.yaml
kubectl apply -f workload-1-dep.yaml

read-host "Next Step - Creates file-config and redeploy"
kubectl apply -f file-configmap.yaml
kubectl apply -f file-secret.yaml
kubectl apply -f workload-1-dep-cm-volume.yaml

read-host "Next Step - Clean up."
kubectl delete deploy workload-1-dep
kubectl delete configmap -l scope=demo
kubectl delete secret -l scope=demo
Set-Location ..
