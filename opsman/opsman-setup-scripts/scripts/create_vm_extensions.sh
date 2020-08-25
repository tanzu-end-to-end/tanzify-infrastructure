#!/bin/bash

set -e


config_path=$1
vars_path=$2

## Setup OM environment vars
source ~/.om_profile

if [ -z "$config_path" ]; then
  echo "Error Applying VM extension. filepath not specified"
  exit 1
fi



if [ -f "$vars_path" ]; then
  minimumsize=10
  actualsize=$(wc -c <"$config_path")
  if [ $actualsize -le $minimumsize ]; then
    echo "No content in vm_extensions file $config_path. Skipping..."
    exit 1
  fi
  echo "Applying VM extension in file $config_path with vars file $vars_path"
  om -k create-vm-extension -c "$config_path" --vars-file "$vars_path"
else
  om -k create-vm-extension -c "$config_path"
fi
