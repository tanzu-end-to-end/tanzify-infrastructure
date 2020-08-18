#!/bin/bash

set -e

config_path=$1
$ops_path=$2

source ~/.om_profile



if [ -z "$config_path" ]; then
  echo "Error setting up tile -config filepath not specified"
  exit 1
fi

if [ -f "$vars_path" ]; then
  om -k configure-product -c "$config_path" --ops-file "$ops_path"
else
  om -k configure-product -c "$config_path"
fi