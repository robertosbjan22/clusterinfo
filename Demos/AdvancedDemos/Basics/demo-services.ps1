# Change to the demo folder
Set-Location Services

read-host "Navigate to the Services page"

read-host "Next Step - Create initial workload with a ClusterIP service"
kubectl apply -f workload-dep.yaml
kubectl apply -f workload-svc-clusterip.yaml

read-host "Next Step - Upgrades the service to a NodePort"
kubectl apply -f workload-svc-nodeport.yaml

read-host "Next Step - Upgrades the service to a LoadBalancer"
kubectl apply -f workload-svc-loadbalancer.yaml

read-host "Wait about a minute or two for the external IP to be available and active."
read-host "Click on the external IP to bring up the website."
read-host "Watch the website as it refreshes, showing how it reaches a different pod after refresh (internal load balancer working)."

read-host "Next Step - Cleans up"
kubectl delete deploy workload-dep
kubectl delete svc workload-svc
Set-Location ..