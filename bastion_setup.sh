#!/bin/bash
# Dynatrace OneAgent Operator
git clone https://github.com/dynatrace/dynatrace-oneagent-operator.git
mv ./apply.sh ./dynatrace-oneagent-operator/deploy/apply.sh
mv ./cleanup.sh ./dynatrace-oneagent-operator/deploy/cleanup.sh

# Utility configuration
sudo ./hub-linux-amd64-2.6.0/install
sudo mv ./jq-linux64 /usr/sbin/jq

git clone https://github.com/dt-seattle-acm-setup/provision-acm-openshift.git

# log into the OpenShift cluster
oc login https://master:443
