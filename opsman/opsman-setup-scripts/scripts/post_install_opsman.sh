#!/bin/bash

####################################
##
## This bash script is run on Opsman VM to setup BOSH CLI
## Note: The configure_director shell script is required to be run before this script runs
##
######################

set -e

source ~/.om_profile

om -k bosh-env > ~/.bosh_profile

source ~/.bosh_profile

# Test authentication
bosh vms