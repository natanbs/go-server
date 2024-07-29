# Repo
service_name=go-server
repo_owner=natanbs
# git clone https://github.com/${repo_owner}/${service_name}.git
# cd ${service_name}

# Build docker app image
echo Build image
cd build
docker build . -t ghcr.io/${repo_owner}/${service_name}:v1.0
cd -

# Docker login to ghcr.io
echo ghcr.io login
token=$(cat ~/.git/.github-token)
docker login -u $repo_owner -p $token ghcr.io

echo Docker push
docker push ghcr.io/${repo_owner}/${service_name}:v1.0
