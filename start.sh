#!/bin/sh
set -xeuo pipefail

/app &
envoy -c /etc/envoy.yaml --service-cluster $CLUSTER --service-node $NODE