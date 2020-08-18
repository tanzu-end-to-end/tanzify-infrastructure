#!/bin/bash

set -e

# Update HTTPS certificate
echo 'Installing HTTPS certificate...'

if [ -f /tmp/tempest.key ]; then
  sudo cp /tmp/tempest.* /var/tempest/cert

  sudo service nginx restart
fi

# TODO: Replace with reliable wait, not even sure what could fail. DNS? OpsMan restart?
sleep 60

# Fix issue with Azure SSH connections getting closed until I figure out what
echo 'Reconfiguring SSHD...'

sudo sed -i 's/ClientAliveInterval.*/ClientAliveInterval 3000/' /etc/ssh/sshd_config
sudo service ssh restart
