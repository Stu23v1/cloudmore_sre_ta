#!/bin/bash
set -x

docker_compose_version="1.29.2"
app_path="/tmp/app"
loop=true

echo "==========================="
echo "Software Setup"
echo "==========================="


# Instaling docker
apt-get update
apt-get install -y docker.io
service docker start
usermod -a -G docker azureuser # Todo Add as variable 
docker info

# Instaling docker-compose
curl -L "https://github.com/docker/compose/releases/download/${docker_compose_version}/docker-compose-$(uname -s)-$(uname -m)" \
-o /bin/docker-compose
chmod +x /bin/docker-compose
docker-compose --version

# Make sure app has been deployed
while [ $loop = true ]
do
    if [[ -d "$app_path" ]]
    then
        echo "Application folder has been found in $app_path"
        echo "proceeding ..."
        loop=false
    fi
sleep 1
done

cd ${app_path}

docker-compose up -d --build
