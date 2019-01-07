#!/bin/bash

echo "Installing Tiller into namespace: kube-system"

echo "Creating service account..."
kubectl create serviceaccount -n kube-system tiller

echo "Assigning cluster role..."
kubectl create clusterrolebinding tiller-binding \
    --clusterrole=cluster-admin \
    --serviceaccount kube-system:tiller

echo "Initializing..."
helm init --service-account tiller

echo "Updating chart repositories..."
helm repo update
