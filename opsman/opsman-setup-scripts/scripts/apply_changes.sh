#!/bin/bash

set -e

source ~/.om_profile

if [ -z "$product_name" ]; then
  echo "Applying changes"
  om -k apply-changes
else
  echo "Applying changes to products"
  om -k apply-changes --product-name "$@"
fi