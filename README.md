# Local Kubernetes in Docker setup.  

## Requirements

* Install WSL2 in Windows 10
* Install Docker Desktop
* Verify you can run docker commands from WSL2.  
* Install kubectl

## Setup .bashrc 

Add the following to the end of your `~/.bashrc` file.

```
# Add kubeconfigs to $KUBECONFIG
for f in `ls ~/.kube/ | grep config.\*.yaml`
do
    export KUBECONFIG="$HOME/.kube/$f:$KUBECONFIG";
done
```

After doing so restart your terminal.  

## Install K3D in WSL2
From WSL2 install K3D.

`curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash`

## Verify K3D is up

`k3d version`

## Check if any clusters are around 

`k3d cluster list`

## Start up a cluster from the included config file

`k3d cluster create --config k3dcluster.yaml`

## Export a Kubeconfig file

`k3d kubeconfig get locallab > ~/.kube/config.k3d.yaml`

## Stop the Cluster

`k3d cluster stop locallab`

## Restart the Cluster

`k3d cluster start locallab`

## Delete the Cluster when done

`k3d cluster delete locallab`

## Verify kubectl can connect to K8S

`kubectl get nodes`
