# Change to the demo folder
Set-Location BlueGreenDeployments

read-host "Next Step - Creates initial blue workload and service"
kubectl apply -f blue-dep.yaml
kubectl apply -f blue-green-svc-blue.yaml

read-host "Open the Services page"
read-host "Wait until the load balancer is created then open a browser to the external IP/port"
read-host "Notice the Blue image"
read-host "Keep the browser page open"

read-host "Next Step - Creates new green workload"
kubectl apply -f green-dep.yaml

read-host "Next Step - Switches the service to new workload"
kubectl apply -f blue-green-svc-green.yaml

read-host "Open to the external IP/Port browser page.  "
read-host "Notice the image is still blue (allowing the current session to end)"
read-host "Open a different browser (like Firefox) and go to the external IP/Port page"
read-host "Notice the green image"

read-host "Next Step - Switches back to blue workload"
kubectl apply -f blue-green-svc-blue.yaml

read-host "Next Step - Deletes green workload"
read-host "This will force all browsers to switch to the blue image"
kubectl delete deploy green-dep

read-host "Next Step - Clean up"
kubectl delete deploy blue-dep
kubectl delete svc blue-green-svc
Set-Location ..