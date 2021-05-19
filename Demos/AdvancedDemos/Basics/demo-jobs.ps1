# Change to the demo folder
Set-Location Jobs

read-host "Navigate to the Jobs page"

read-host "Next Step - Creates a Job"
kubectl apply -f countdown-job.yaml

read-host "Next Step - Create a Cron Job"
kubectl apply -f sample-cron-job.yaml

read-host "Click on the Cron Jobs tab.  Wait for new jobs to show up.  Will maintain history of past 2 jobs."

read-host "Next Step - Cleans up"
kubectl delete job countdown-job
kubectl delete cronjob sample-cron-job
Set-Location ..