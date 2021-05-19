# Kubernetes Cluster Info
In-cluster Kubernetes UI designed for teaching Kubernetes concepts.

![](ClusterInfo.png)



# NEVER USE CLUSTER INFO IN A PRODUCTION CLUSTER!!



# Installation:

Install Azure CLI from the following link:

```code
https://aka.ms/installazurecliwindows
```

Running as administrator, execute the following command on Powershell

```shell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

Execute the following command on Powershell to install Helm 3

```shell
choco install kubernetes-helm
```

Install Kubernetes Client

```shell
az aks install-cli
```
>
> [!NOTE]
> Check the result from previous command to proper add Kubectl on your Path
>

Log-in your Azure Subscription (check if you are logged on the right subscription)

```shell
az login
```

create an AKS

```shell
az group create --name myResourceGroup --location eastus
az provider show -n Microsoft.OperationsManagement -o table
az provider show -n Microsoft.OperationalInsights -o table
az provider register --namespace Microsoft.OperationsManagement
az provider register --namespace Microsoft.OperationalInsights
az aks create --resource-group myResourceGroup --name myAKSCluster --node-count 1 --enable-addons monitoring --generate-ssh-keys
```

more information : https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough

Get AKS Credentials

```shell
az aks get-credentials --resource-group myResourceGroup --name myAKSCluster
```

Add the Helm repo:

```shell
helm repo add scubakiz https://clusterinfosa.blob.core.windows.net/helm
```

Install the Helm chart:

```shell
helm install clusterinfo scubakiz/clusterinfo
```

Wait about 60 seconds for the app to start.  

Forward the service and the app from your local machine at http://localhost:5252:

```
kubectl port-forward svc/clusterinfo 5252:5252 -n clusterinfo
```

# Clean up
To remove Cluster Info from your cluster, uninstall the Helm chart:
```bash
helm uninstall clusterinfo
```

Remove the Helm repo:
```bash
helm repo remove scubakiz
```




#### Technologies Used

This application is written in C# using .Net Core 3.1 with Blazor.

