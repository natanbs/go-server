# Helm repo
echo ghcr.io login
service_name=go-server
repo_owner=natanbs
token=$(cat ~/.git/.github-token)
docker login -u $repo_owner -p $token ghcr.io
# Package chart
mkdir -p Packages
cd Packages
helm package ../helm
helm repo index .
cd -

# Push Helm package to Github
# export CHART_VERSION=$(grep 'version:' ./helm/Chart.yaml | tail -n1 | awk '{ print $2}')
# helm push helm/charts/${service_name}-${CHART_VERSION}.tgz oci://ghcr.io/${repo_owner}

# Add Helm package to "Github Pages"
helm repo add ${service_name} https://${repo_owner}.github.io/${service_name}/Packages
helm upgrade --install -n app-ns ${service_name} ${service_name}/${service_name} --create-namespace
