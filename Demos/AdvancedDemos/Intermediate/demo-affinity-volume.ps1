# Change to the demo folder
Set-Location AffinityVolume

read-host "Navigate to the Settings page.  Turn on Mini Pods."
read-host "Navigate to the Nodes page."

read-host "Next Step - Creates initials workloads.  All will be on same node"
kubectl apply -f pvc.yaml
kubectl apply -f pvc-dep-replicas-6.yaml

read-host "Next Step - Increases workload instances.  All still on same node"
kubectl scale --replicas=12 deploy/pvc-pod-dep


read-host "Next Step - Increases workload instances past limit.  Some will remain Pending even if there's room on other nodes."
kubectl scale --replicas=24 deploy/pvc-pod-dep

read-host "Next Step - Change the Affinity rule to Preferred.  Pending pods will be scheduled on other nodes."
kubectl apply -f pvc-dep-replicas-24-preferred.yaml

read-host "Notice that new pods can't start because the volume has already been attached to the other node."

read-host "Next Step - Cleans up"
kubectl delete deploy pvc-pod-dep
Set-Location ..