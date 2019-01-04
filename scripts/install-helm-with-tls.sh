#!/usr/bin/env bash

# This script generates necessary keys and certificates, and deploys Helm and Tiller with TLS enabled

echo "Installing helm..."
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash

echo "Creating Tiller service account and assigning cluster role..."
kubectl create serviceaccount tiller --namespace kube-system
kubectl create clusterrolebinding tiller \
  --clusterrole cluster-admin \
  --serviceaccount=kube-system:tiller

