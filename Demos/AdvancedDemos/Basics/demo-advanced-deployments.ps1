# Change to the demo folder
Set-Location AdvancedDeployments

read-host "Navigate to the Deployments page"

read-host "Next Step - Creates initial deployment"
kubectl apply -f workload-1-dep-lime.yaml
kubectl apply -f workload-1-svc.yaml

read-host "Open the Deployment Info Panel by clicking the Info (i) icon to the right of the deployment name."

read-host "Next Step - Updates the deployment to trigger a new replica set"
kubectl apply -f workload-1-dep-yellow.yaml --record

read-host "Observe and explain toolbar buttons."

read-host "Next Step - Updates the MinReadSeconds and trigger a new replica set"
kubectl apply -f workload-1-dep-aqua-min-ready-seconds.yaml --record

read-host "Next Step - Change the MaxSurge and MaxUnavailable."
kubectl apply -f workload-1-dep-magenta-max-surge-max-unavailable.yaml

read-host "Switch back and forth to the Services page."
read-host "Observe how the Service can load balance both versions at the same time."

read-host "Next Step - Changes deployment strategy to Recreate"
kubectl apply -f workload-1-dep-orange-recreate.yaml

read-host "Notice none of the other surge/unavailable values are set"

read-host "Next Step - Changes deployment strategy to Rolling Update and sets Revision History"
kubectl apply -f workload-1-dep-gray-revision-history.yaml

read-host "Next Step - Cleans up"
kubectl delete deploy workload-1-dep
kubectl delete svc workload-1-svc
Set-Location ..