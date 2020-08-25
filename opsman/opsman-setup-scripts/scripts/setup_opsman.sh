#!/bin/bash

####################################
##
## This bash script is run on the OpsManager node itself to setup dependencies
##
####################################

set -e

PIVNET_CLI_VERSION=1.0.4
OM_VERSION=6.1.1

pivnet_api_token=$1
om_domain=$2
om_password=$3

sudo apt-get -qq update
sudo apt-get -qq install -y jq nano

# Install pivnet CLI
if [ ! -f /usr/bin/pivnet ]; then
  echo 'Downloading pivnet CLI...'

  wget -q https://github.com/pivotal-cf/pivnet-cli/releases/download/v$PIVNET_CLI_VERSION/pivnet-linux-amd64-$PIVNET_CLI_VERSION -O pivnet

  sudo mv pivnet /usr/bin
  sudo chmod +x /usr/bin/pivnet
else
  echo "Skipping pivnet CLI"
fi

# Install om CLI
if [ ! -f /usr/bin/om ]; then
  echo 'Downloading om CLI...'

  wget -q https://github.com/pivotal-cf/om/releases/download/$OM_VERSION/om-linux-$OM_VERSION -O om

  sudo mv om /usr/bin
  sudo chmod +x /usr/bin/om
else 
  echo "Skipping om CLI"
fi

# Login to pivnet
echo 'Logging in to pivnet...'
pivnet login --api-token $pivnet_api_token

# Convenience scripts
echo 'Installing convenience scripts...'

####

sudo mv /tmp/apply_changes.sh /usr/bin/apply_changes
sudo chmod +x /usr/bin/apply_changes
###
sudo mv /tmp/configure_authentication.sh /usr/bin/configure_authentication
sudo chmod +x /usr/bin/configure_authentication
##
sudo mv /tmp/configure_director.sh /usr/bin/configure_director
sudo chmod +x /usr/bin/configure_director
##
sudo mv /tmp/configure_tile_with_ops.sh /usr/bin/configure_tile_with_ops
sudo chmod +x /usr/bin/configure_tile_with_ops
##
sudo mv /tmp/configure_tile_with_vars.sh /usr/bin/configure_tile_with_vars
sudo chmod +x /usr/bin/configure_tile_with_vars
##
sudo mv /tmp/create_vm_extensions.sh /usr/bin/create_vm_extensions
sudo chmod +x /usr/bin/create_vm_extensions
##
sudo mv /tmp/destroy_opsman.sh /usr/bin/destroy_opsman
sudo chmod +x /usr/bin/destroy_opsman
##
sudo mv /tmp/install_raw_tile.sh /usr/bin/install_raw_tile
sudo chmod +x /usr/bin/install_raw_tile
##
sudo mv /tmp/install_ssl_certs.sh /usr/bin/install_ssl_certs
sudo chmod +x /usr/bin/install_ssl_certs
##
sudo mv /tmp/install_tile.sh /usr/bin/install_tile
sudo chmod +x /usr/bin/install_tile
##
sudo mv /tmp/post_install_opsman.sh /usr/bin/post_install_opsman
sudo chmod +x /usr/bin/post_install_opsman
##
sudo mv /tmp/wrap.sh /usr/bin/wrap
sudo chmod +x /usr/bin/wrap

echo 'Setting up profile scripts...'

cat << EOF > ~/.om_profile
export OM_TARGET=https://$om_domain
export OM_USERNAME=admin
export OM_PASSWORD=$om_password
export PIVNET_TOKEN=$pivnet_api_token
EOF

cat << EOF >> ~/.bash_profile
source ~/.om_profile
EOF

source ~/.om_profile

# Setup config dir
if [ ! -d ~/config ]; then
  mkdir -p ~/config
fi

sleep 20

# Set up for file locks
sudo touch /var/run/paasify.lock
sudo chown ubuntu:ubuntu /var/run/paasify.lock