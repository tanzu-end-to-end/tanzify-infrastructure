#!/bin/bash

set -e

product_name=$1

source ~/.om_profile

if [ -z "$product_name" ]; then
  echo "Applying changes"
  om -k apply-changes
else
  echo "Applying changes to $product_name"
  om -k apply-changes --product-name "$product_name"
fi