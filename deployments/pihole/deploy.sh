# fix that worked for me #! do not use for prod enviroments
# https://stackoverflow.com/a/65755417/18377883
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

# getting the repo
helm repo add mojo2600 https://mojo2600.github.io/pihole-kubernetes/ 
helm repo update

kubectl create namespace pihole

# disabling traefic to not conflict with pihole this should be a temporary fix
# issue open at: https://github.com/MoJo2600/pihole-kubernetes/issues/230
kubectl delete -n kube-system helmcharts traefik

helm install --version '2.5.8' --namespace pihole --values values.yaml pihole mojo2600/pihole

# uninstall command:
# helm uninstall pihole -n pihole