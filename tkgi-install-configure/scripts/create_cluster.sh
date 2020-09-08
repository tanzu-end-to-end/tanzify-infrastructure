$HOME/pks-login.sh
echo "Creating small plan Cluster ${cluster_name} using API endpoint ${api_endpoint} ...."
pks create-cluster ${cluster_name} -e ${api_endpoint} -p small --wait --non-interactive
echo "Creating Cluster complete."
echo "Get credentials for ${cluster_name}"
pks get-credentials ${cluster_name}
echo "Calling kubectl cluster-info"
kubectl cluster-info

