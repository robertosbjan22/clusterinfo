# Change to the demo folder
Set-Location MultiContainerPods

read-host "Navigate to the Deployments Page"

read-host "Next Step - Creates a simple multi-container workload"
kubectl apply -f multi-0-dep.yaml

read-host "Next Step - Creates multi-container workload with 1 container that doesn't start and 1 that fails after a while"
kubectl apply -f multi-1-dep.yaml

read-host "Next Step - Creates a more complex multi-container workload with Init Containers"
kubectl apply -f multi-2-dep.yaml

read-host "Click on any of the new pods to view Pod Details.  Watch the containers tabs."

read-host "Next Step - Cleans up"
kubectl delete deploy multi-0-dep
kubectl delete deploy multi-1-dep
kubectl delete deploy multi-2-dep
Set-Location ..