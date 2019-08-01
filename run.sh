#!/bin/bash

if [ ! -z ${PLUGIN_GCPACCOUNT} ]; then
    GCPACCOUNT=${PLUGIN_GCPACCOUNT}
    echo ${GCPACCOUNT} | base64 -d > gcpaccount.json
fi

gcloud auth activate-service-account --key-file=gcpaccount.json

if [ ! -z ${PLUGIN_GCPPROJECT} ]; then
    PROJECT_ID=${PLUGIN_GCPPROJECT}
    gcloud config set project ${PROJECT_ID}
fi

if [ ! -z ${PLUGIN_GCPPLATFORM} ]; then
    PLATFORM=${PLUGIN_GCPPLATFORM}
    gcloud config set run/platform ${PLATFORM}
else
    gcloud config set run/platform managed
fi

if [ ! -z ${PLUGIN_GCPREGION} ]; then
    REGION=${PLUGIN_GCPREGION}
    gcloud config set run/region ${REGION}
else
    gcloud config set run/region us-east1
fi 

gcloud beta run deploy ${PLUGIN_DEPLOYMENT} --image=${PLUGIN_REPO}:${PLUGIN_TAG} --quiet