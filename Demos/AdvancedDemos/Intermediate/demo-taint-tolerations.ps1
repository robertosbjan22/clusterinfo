# Change to the demo folder
Set-Location TaintsTolerations

read-host "Navigate to the Settings page."
read-host "Turn ON Mini or Micro Pods."
read-host "Navigate to the Nodes page."

read-host "Next Step - Creates initial workloads"
kubectl apply -f workload-1.yaml
kubectl apply -f workload-2.yaml
kubectl apply -f workload-3.yaml

$selectedNode = read-host "Enter the Node Name of one node" 

read-host "Next Step - Adds color and Process label to Node"
kubectl label node $selectedNode color=lime --overwrite
kubectl label node $selectedNode allowedprocess=gpu --overwrite

read-host "Notice the color box appear in the Node"

read-host "Next Step - Adds Node Selector to Lime deployment"
kubectl apply -f workload-1-node-selector.yaml

read-host "Wait for all the Lime pods to be rescheduled on the selected node"

read-host "Next Step - Adds Taint to Node"
kubectl taint node $selectedNode onlyprocess=gpu:NoExecute

read-host "Wait for ALL pods to be evicted from selected node."

read-host "Observe how Lime pods cannot be scheduled.  Examine their events."

read-host "Next Step - Adds Toleration to Lime deployment"
kubectl apply -f workload-1-toleration.yaml

read-host "Observe how only the Lime pods are scheduled on selected node and all others are on other nodes."

read-host "Next Step - Cleans up"
kubectl delete deploy -l scope=demo
kubectl label node $selectedNode color-
kubectl label node $selectedNode allowedprocess-
kubectl taint node $selectedNode onlyprocess-
Set-Location ..