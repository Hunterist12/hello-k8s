#!/bin/bash

echo "Deleting resources..."
kubectl delete -f ./manifests/deployment.yaml
kubectl delete -f ./manifests/service.yaml
kubectl delete -f ./manifests/ingress.yaml

echo "Installing nginx ingress controller in namespace: ingress-nginx"
helm del --purge mynginx
kubectl delete namespace ingress-nginx

echo "Uninstalling tiller..."
helm reset

echo "Revoking permissions..."
kubectl delete clusterrolebinding i-am-king

echo "Deleting cluster..."
gcloud container clusters delete hello-golang
