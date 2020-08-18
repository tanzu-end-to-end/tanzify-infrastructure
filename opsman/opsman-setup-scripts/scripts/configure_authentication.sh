#!/bin/bash

####################################
##
## This bash script is run on the OpsManager node itself to configure authentication
## Note: The setup_opsman shell script is required to be run before this script runs
##
######################

set -e

## Setup OM environment vars
source ~/.om_profile

# Configure authentication in OpsMan
echo 'Configuring OpsMan authentication...'
om -k configure-authentication -u $OM_USERNAME -p $OM_PASSWORD -dp $OM_PASSWORD

