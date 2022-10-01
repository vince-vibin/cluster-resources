function handleError() {
    currDate=`date +%D-%T`
    echo "$currDate | CRITICAL ERROR - pls review..."
    echo $1
    sleep 20
}

# fix that worked for me #! do not use for prod enviroments
# https://stackoverflow.com/a/65755417/18377883
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml || handleError

{
    # getting the repo
    helm repo add mojo2600 https://mojo2600.github.io/pihole-kubernetes/
    helm repo update
} || {
    handleError "Error while trying to get repository"
}

kubectl create namespace pihole || handleError

# disabling traefic to not conflict with pihole this should be a temporary fix
# issue open at: https://github.com/MoJo2600/pihole-kubernetes/issues/230
kubectl delete -n kube-system helmcharts traefik || handleError

helm install --version '2.9.0' --namespace pihole --values values.yaml pihole mojo2600/pihole || handleError

# uninstall command:
# helm uninstall pihole -n pihole