#!/bin/bash

# This script creates a cluster in GKE using the (optional) provided cluster name under your current project id.
#
# It takes 1 argument:
#   (cluster name) - optional, the name of the cluster to be created; defaults to "(current project id)-cluster"

echo "Creating env variables..."
if [ -z $1 ]
    then
        export CLUSTER_NAME="$(gcloud config get-value project -q)-cluster"
    else
        export CLUSTER_NAME=$1
fi

echo "Creating cluster: $CLUSTER_NAME"
gcloud container clusters create ${CLUSTER_NAME}

echo "Getting cluster credentials..."
gcloud container clusters get-credentials ${CLUSTER_NAME}
