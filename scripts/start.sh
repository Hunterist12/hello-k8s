#!/usr/bin/env bash

# This script creates a cluster in GKE

echo "Creating env variables..."
export GCLOUD_PROJECT=$(gcloud config get-value project)
export INSTANCE_ZONE=us-central1-a
export PROJECT_NAME=hello-cloudkite
export CLUSTER_NAME=${PROJECT_NAME}-cluster
export CONTAINER_NAME=${PROJECT_NAME}-container

echo "Setting compute zone..."
gcloud config set compute/zone ${INSTANCE_ZONE}

echo "Enabling services..."
gcloud services enable compute.googleapis.com
gcloud services enable container.googleapis.com
gcloud services enable cloudbuild.googleapis.com

echo "Creating cluster..."
gcloud container clusters create ${CLUSTER_NAME}

echo "Getting cluster credentials..."
gcloud container clusters get-credentials ${CLUSTER_NAME}

echo "Creating cluster administrator permissions..."
kubectl create clusterrolebinding cluster-admin-binding \
    --clusterrole=cluster-admin --user=$(gcloud config get-value account)
