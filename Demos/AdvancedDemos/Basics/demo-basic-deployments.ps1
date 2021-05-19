# Change to the demo folder
Set-Location BasicDeployments

read-host "Navigate to the Deployments page"

read-host "Next Step - Creates initial deployments"
kubectl apply -f workload-1-dep-lime.yaml --record
kubectl apply -f workload-2-dep.yaml --record

read-host "Next Step - Updates the deployment to trigger a new replica set"
kubectl apply -f workload-1-dep-yellow.yaml --record

read-host "Next Step - Updates the deployment again making multiple changes"
kubectl apply -f workload-1-dep-maroon.yaml --record

read-host "Observe and explain toolbar buttons."

read-host "Next Step - Undoes rollout to bring previous replica set back"
kubectl rollout undo deploy workload-1-dep

read-host "Next Step - Changes color label to trigger a new replica set"
kubectl apply -f workload-1-dep-pink.yaml --record

read-host "Open the Deployment Info Panel by clicking the Info (i) icon to the right of the deployment name."

read-host "Next Step - Changes color label and INVALID image replica set"
kubectl apply -f workload-1-dep-aqua-invalid.yaml --record

read-host "Next Step - Undoes rollout to previous replica set"
kubectl rollout undo deploy workload-1-dep

read-host "Next Step - Undoes rollout back to Rev 1"
kubectl rollout undo deploy workload-1-dep --to-revision=1

read-host "Next Step - Changes deployment strategy to Recreate"
kubectl apply -f workload-1-dep-blue-recreate.yaml

read-host "Next Step - Changes deployment strategy to Rolling Update and sets Revision History"
kubectl apply -f workload-1-dep-orange-revision-history.yaml

read-host "Next Step - Cleans up"
kubectl delete deploy workload-1-dep
kubectl delete deploy workload-2-dep
Set-Location ..