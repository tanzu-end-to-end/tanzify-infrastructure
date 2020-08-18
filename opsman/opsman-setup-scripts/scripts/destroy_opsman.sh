#!/bin/bash

set -e

## Setup OM environment vars
source ~/.om_profile

om -k delete-installation -f
