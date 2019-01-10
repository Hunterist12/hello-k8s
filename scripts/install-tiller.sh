#!/bin/bash

### WITHOUT SEPARATE NAMESPACE ###

echo "Installing tiller into namespace: kube-system"

echo "Creating service account..."
kubectl create serviceaccount -n kube-system tiller

echo "Assigning cluster role..."
kubectl create clusterrolebinding tiller-binding \
    --clusterrole cluster-admin \
    --serviceaccount kube-system:tiller

echo "Initializing..."
helm init --service-account tiller

echo "Updating chart repositories..."
helm repo update

###############################################

# ### WITH SEPARATE NAMESPACE ###

# echo "Installing tiller into namespace: tiller-world"
# kubectl create namespace tiller-world

# echo "Configuring rbac for tiller..."
# kubectl create -f ./manifests/rbac/tiller.yaml

# echo "Configuring rbac for helm..."
# kubectl create -f ./manifests/rbac/helm.yaml

# echo "Initializing..."
# helm init --service-account tiller --tiller-namespace tiller-world

# echo "Updating chart repositories..."
# helm repo update
