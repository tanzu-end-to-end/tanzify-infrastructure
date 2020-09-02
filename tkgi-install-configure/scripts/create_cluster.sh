$HOME/pks-login.sh
echo "Creating small plan Cluster ${cluster_name} using API endpoint ${api_endpoint} ...."
pks create-cluster ${cluster_name} -e ${api_endpoint} -p small --wait --non-interactive
echo "Creating Cluster complete."

