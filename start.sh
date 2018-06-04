#!/usr/bin/env bash
set -xeuo pipefail

sed -i "s/_NODE_ID_/${NODE_ID}/" /etc/envoy.yaml
sed -i "s/_NODE_CLUSTER_/${NODE_CLUSTER}/" /etc/envoy.yaml
sed -i "s/_XDS_CLUSTER_TYPE_/${XDS_CLUSTER_TYPE}/" /etc/envoy.yaml
sed -i "s/_XDS_HOST_/${XDS_HOST}/" /etc/envoy.yaml
sed -i "s/_XDS_PORT_/${XDS_PORT}/" /etc/envoy.yaml

 /app & # TODO: exit if app fails to start
 envoy -c /etc/envoy.yaml