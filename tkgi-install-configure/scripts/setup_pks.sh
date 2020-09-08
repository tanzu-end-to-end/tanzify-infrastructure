#!/bin/bash

set -e

if [ ! -f $HOME/.uaa ]; then
  sudo apt install -y build-essential ruby ruby-dev

  sudo gem install cf-uaac

  uaac target https://${api_endpoint}:8443 --skip-ssl-validation

  admin_secret=$(om -k credentials -p pivotal-container-service -c .properties.pks_uaa_management_admin_client -t json | jq -r '.secret')

  uaac token client get admin -s $admin_secret

  uaac user add ${pks_username} --emails ${pks_username}@localhost -p ${pks_password}

  uaac member add pks.clusters.admin ${pks_username}

  touch $HOME/.uaa
fi


mkdir $HOME/pks-download

echo "Downloading pks CLI from pivnet"
pivnet download-product-files -p pivotal-container-service -r ${pks_version} -g "pks-linux-amd64*" -d $HOME/pks-download

sudo mv $HOME/pks-download/pks-linux-amd64* /usr/local/bin/pks

sudo chmod +x /usr/local/bin/pks

echo "Downloading kubectl  from pivnet"
pivnet download-product-files -p pivotal-container-service -r ${pks_version} -g "kubectl-linux-amd64*" -d $HOME/pks-download

sudo mv $HOME/pks-download/kubectl-linux-amd64* /usr/local/bin/kubectl

sudo chmod +x /usr/local/bin/kubectl

cat << EOF > $HOME/pks-login.sh
pks login -a https://${api_endpoint}:9021 -u ${pks_username} -p ${pks_password} -k
EOF

chmod +x $HOME/pks-login.sh