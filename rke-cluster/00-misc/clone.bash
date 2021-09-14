#!/bin/bash

VERSION=v0.0.8

sudo docker run \
-v $(pwd)/rke-cluster:/wip/output \
-v ${HOME}/.ssh/:/root/.ssh/ \
-e IASC_VCS_MODE=git \
-e IASC_VCS_URL='https://github.com/its-software-services-customers/yru-openedx-infra-nonprod.git' \
-e IASC_VCS_REF=develop \
-e IASC_VCS_FOLDER=rke-cluster \
-e IASC_VAULT=gs://yru-openedx-vault/nonprod/secrets-nonprod.txt \
-it gcr.io/its-artifact-commons/iasc:${VERSION} \
init

sudo chown -R yruadmin:yruadmin rke-cluster
