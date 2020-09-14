$HOME/pks-login.sh
echo "Creating small plan Cluster ${cluster_name} using API endpoint ${cluster_api_endpoint} ...."
pks create-cluster ${cluster_name} -e ${cluster_api_endpoint} -p small --wait --non-interactive
echo "Creating Cluster ${cluster_name} complete. API enpoint is ${cluster_api_endpoint}"

# Get the BOSH deployment ID
service_instance=$(pks cluster ${cluster_name} --json | jq -r '.uuid')

source ~/.bosh_profile

echo "In order to access this Cluster externally, Create a Load Balancer with a public IP for your Cloud provider pointing to the following K8's master nodes:"
# Get the master nodes for the cluster using BOSH CLI
bosh -d service-instance_$service_instance vms --json | jq -r '.Tables[] | .Rows[] | .instance ' | grep master

echo "Also make sure to configure your DNS so that the Cluster API endpoint at ${cluster_api_endpoint} is pointing to the IP of your Load Balancer."
echo "After that fetch credentials for ${cluster_name} using 'pks get-credentials ${cluster_name}'. After this, you an use kubectl with --insecure-skip-tls-verify=true flag."

echo "If you are connecting internally (i.e. on Opsman VM), modify the .kube/config file to set API endpoint to the master node IP address."


