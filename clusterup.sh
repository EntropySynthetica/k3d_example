k3d cluster create --config k3dcluster.yaml --volume "$(pwd)/helm-ingress-nginx.yaml:/var/lib/rancher/k3s/server/manifests/helm-ingress-nginx.yaml"

k3d kubeconfig get locallab > ~/.kube/config.k3d.yaml