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
if [ ! -f /usr/bin/apply_changes ]; then
  sudo mv /tmp/apply_changes.sh /usr/bin/apply_changes
fi

sudo chmod +x /usr/bin/apply_changes
###

if [ ! -f /usr/bin/configure_authentication ]; then
  sudo mv /tmp/configure_authentication.sh /usr/bin/configure_authentication
fi

sudo chmod +x /usr/bin/configure_authentication
##

if [ ! -f /usr/bin/configure_director ]; then
  sudo mv /tmp/configure_director.sh /usr/bin/configure_director
fi

sudo chmod +x /usr/bin/configure_director
##

if [ ! -f /usr/bin/configure_tile ]; then
  sudo mv /tmp/configure_tile_with_vars.sh /usr/bin/configure_tile_with_vars
fi

sudo chmod +x /usr/bin/configure_tile_with_vars
##
if [ ! -f /usr/bin/configure_tile_with_ops ]; then
  sudo mv /tmp/configure_tile_with_ops.sh /usr/bin/configure_tile_with_ops
fi

sudo chmod +x /usr/bin/configure_tile_with_ops
##

if [ ! -f /usr/bin/destroy_opsman ]; then
  sudo mv /tmp/destroy_opsman.sh /usr/bin/destroy_opsman
fi

sudo chmod +x /usr/bin/destroy_opsman
##

if [ ! -f /usr/bin/install_raw_tile ]; then
  sudo mv /tmp/install_raw_tile.sh /usr/bin/install_raw_tile
fi

sudo chmod +x /usr/bin/install_raw_tile
##

if [ ! -f /usr/bin/install_ssl_certs ]; then
  sudo mv /tmp/install_ssl_certs.sh /usr/bin/install_ssl_certs
fi

sudo chmod +x /usr/bin/install_ssl_certs
##

if [ ! -f /usr/bin/install_tile ]; then
  sudo mv /tmp/install_tile.sh /usr/bin/install_tile
fi

sudo chmod +x /usr/bin/install_tile
##

if [ ! -f /usr/bin/post_install_opsman ]; then
  sudo mv /tmp/post_install_opsman.sh /usr/bin/post_install_opsman
fi

sudo chmod +x /usr/bin/post_install_opsman
##

if [ ! -f /usr/bin/wrap ]; then
  sudo mv /tmp/wrap.sh /usr/bin/wrap
fi

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