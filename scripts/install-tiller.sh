#!/bin/bash

if [ -z $1 ]
  then
    export NAMESPACE=kube-system
  else
    export NAMESPACE=$1
fi

echo "Installing Tiller into namespace: $NAMESPACE"

echo "Creating service account..."
kubectl create serviceaccount -n $NAMESPACE tiller

echo "Assigning cluster role..."
kubectl create clusterrolebinding tiller-binding \
    --clusterrole=cluster-admin \
    --serviceaccount $NAMESPACE:tiller

echo "Initializing..."
helm init --service-account tiller

echo "Updating chart repositories..."
helm repo update
