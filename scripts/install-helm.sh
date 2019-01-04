#!/usr/bin/env bash

echo "Installing Helm..."
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash

echo "Creating Tiller service account..."
kubectl --namespace kube-system create serviceaccount tiller

echo "Creating cluster role for Tiller..."
kubectl create clusterrolebinding tiller \
  --clusterrole cluster-admin \
  --serviceaccount=kube-system:tiller

echo "Initializing Helm..."
helm init --service-account tiller
helm repo update
