# Change to the demo folder
Set-Location CanaryDeployments

read-host "Open the Deployments page"

read-host "Next Step - Creates yellow and red workloads and service"
kubectl apply -f canary-1-dep.yaml
kubectl apply -f canary-2-dep.yaml
kubectl apply -f canary-svc.yaml

read-host "Open the Services page"
read-host "Observe how service can select either deployment"

read-host "Next Step - Clean up"
kubectl delete deploy canary-1-dep
kubectl delete deploy canary-2-dep
kubectl delete svc canary-svc
Set-Location ..