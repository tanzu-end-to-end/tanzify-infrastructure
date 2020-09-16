#!/bin/bash

set -e

product_names=$1

source ~/.om_profile


if [ -z "$product_names" ]; then
  echo "Applying changes"
  om -k apply-changes
else
  echo "Applying changes to products"
  om -k apply-changes --product-name "$@"
fi