#!/bin/bash

# This script builds an image at the provided filepath and pushes it to Google Container Registry under the current project_id using the provided tag
# It takes two arguments:
#   1-(name)     - required, tag for image, format= imageName:version
#   2-(filepath) - required, the root directory of the image you want to build

if [ -z $1 ] || [ -z $2 ]
    then
        echo "ERROR: Requires arguments, (name) (filepath)"
        exit 1
fi

echo "Fetching project_id..."
export PROJECT_ID=$(gcloud config get-value project -q)

echo "Building image: $PROJECT_ID/$1"
echo "from source: $2"
gcloud builds submit --tag gcr.io/$PROJECT_ID/$1 $2
