$HOME/pks-login.sh
echo "Creating small plan Cluster ${cluster_name} using API endpoint ${cluster_api_endpoint} ...."
pks create-cluster ${cluster_name} -e ${cluster_api_endpoint} -p ${plan} --wait --non-interactive
echo "********** Creating Cluster ${cluster_name} with plan ${plan} complete. API endpoint is ${cluster_api_endpoint}  ***********"

# Get the BOSH deployment ID
service_instance=$(pks cluster ${cluster_name} --json | jq -r '.uuid')

source ~/.bosh_profile

echo "In order to access this Cluster externally, Do the following:"
echo " 1. Create a Load Balancer with a public IP for your Cloud provider pointing to the following K8's master nodes:"
# Get the master nodes for the cluster using BOSH CLI
bosh -d service-instance_$service_instance vms --json | jq -r '.Tables[] | .Rows[] | .instance ' | grep master

echo "2. Configure your DNS so that the Cluster API endpoint at ${cluster_api_endpoint} is pointing to the IP of your Load Balancer."
echo "3. Fetch credentials for ${cluster_name} using 'pks get-credentials ${cluster_name}'. After this, you an use kubectl with --insecure-skip-tls-verify=true flag."

echo "Note: If you don't /can't modify DNS or connecting only internally (i.e. via Opsman VM/Jumpbox), do just Step 3 and modify the .kube/config file to change API endpoint to the master node IP address."


