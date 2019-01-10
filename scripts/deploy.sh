#/bin/bash

# start cluster
echo "Starting cluster: hello-golang"
gcloud container clusters create hello-golang

# claim cluster-admin privileges
echo "Assigning cluster-admin privileges to: $(gcloud config get-value account)"
kubectl create clusterrolebinding i-am-king \
    --clusterrole cluster-admin \
    --user $(gcloud config get-value account)

# install tiller
./scripts/install-tiller.sh

# # install nginx ingress controller
# echo "Installing nginx ingress controller in namespace: ingress-nginx"
# kubectl create namespace ingress-nginx
# helm install stable/nginx-ingress --name my-nginx \
#     --namespace ingress-nginx \
#     --set rbac.create=true

# # create deployment, service, and ingress resources
# echo "Creating resources..."
# kubectl create -f ./manifests/deployment.yaml
# kubectl create -f ./manifests/service.yaml
# kubectl create -f ./manifests/ingress-prod.yaml

# # install and configure cert manager
# echo "Installing and configuring cert-manager"
# helm install stable/cert-manager --name cert-manager --namespace cert-manager
# kubectl create -f manifests/cert-manager/letsencrypt-prod.yaml

# #install prometheus
# echo "Installing prometheus..."
# helm install stable/prometheus --name prometheus --namespace monitoring

# #install grafana
# echo "Installing grafana..."
# helm install stable/grafana --name grafana --namespace monitoring
