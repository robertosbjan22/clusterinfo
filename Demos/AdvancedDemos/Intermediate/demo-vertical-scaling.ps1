# Change to the demo folder
Set-Location VerticalScaling

# Just in case other demo was run
kubectl delete resourcequota -l scope=demo
kubectl delete limitranges -l scope=demo

read-host "Navigate to the Settings page."
read-host "Turn ON Micro Pods."
read-host "Navigate to the Nodes page."

read-host "Next Step - Creates initial workload"
kubectl apply -f workload-greedy.yaml

read-host "Observe how pods fit on existing nodes"

read-host "Next Step - Increases replica count"
kubectl scale --replicas=50 deploy/workload-greedy

read-host "Observe how some pods can't be scheduled."
read-host "Examine the events on the Pending pods."
read-host "Wait a few minute for additional nodes to be added and availabe to the cluster."
read-host "Observe how Pending pods are automatically scheduled on new nodes."

read-host "Next Step - Cleans up"
kubectl delete deploy workload-greedy
Set-Location ..