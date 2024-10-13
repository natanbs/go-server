# Update these variables
repo_owner=natanbs
service_name=go-server
tag=v0.0.1
# git clone https://github.com/${repo_owner}/${service_name}.git
# cd ${service_name}

# Build docker app image
echo Build image
cd build
image=ghcr.io/${repo_owner}/${service_name}/${service_name}
echo Building ${image}:${tag}
echo docker build . -t ${image}:${tag}
docker build . -t ${image}:${tag}
cd -

# Docker login to ghcr.io
echo ghcr.io login
token=$(cat ~/.git/.github-token)
#docker login -u $repo_owner -p $token ghcr.io
echo $token | docker login ghcr.io -u ${repo_owner} --password-stdin

echo docker push ${image}:${tag}
docker push ${image}:${tag}

#echo Tag and push latest
#docker tag ghcr.io/${repo_owner}/${service_name}:v1.0 ghcr.io/${repo_owner}/${service_name}:latest
#docker push ghcr.io/${repo_owner}/${service_name}:latest

# Tag and push latest
echo Tag and push latest
echo docker tag ${image}:${tag} ${image}:latest
docker tag ${image}:${tag} ${image}:latest
echo docker push ${image}:latest
docker push ${image}:latest
