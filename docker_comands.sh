sudo journalctl -u docker.service

#problem with gpu+docker
sudo snap remove docker --purge

#debug
docker run --name name_continer -d -t image:tag tail -f /dev/null #or
docker run --name name_continer -d -t image:tag sleep infinity

#size layers
docker history tts:v1

#practical
docker build -t board:v1
docker run -it --name test -v ${PWD}:/ocr_service -dp 8008:8008 python:3.10-slim
docker run -it --name test -v ${PWD}:/code:ro -v /src/node_moudls -p 9000:8000 -d board:v1 #one way binding using add read_only(ro) and protect node_moudls
docker run -it --name test -v ${PWD}/src:/code/src:ro -p 9000:8000 -d board:v1 # simplest
docker run -it --name test -v ${PWD}/src:/code/src:ro -p 9000:8000 --env-file ./.env -d board:v1 # simplest

#docker compose
docker compose -f development.yml --env-file .env build
docker compose -f development.yml --env-file .env up
docker compose -f development.yml --env-file .env down
docker compose -f development.yml config

#docker swarm
docker swarm join --token SWMTKN-1-0nqms7hol32egurdm4w7lyut147bfockm0p0q4klzi70j83sbw-10zo9g6i5qztveex31dil59gu 192.168.50.125:2377
docker stack deploy -c production.yml prod
docker stack rm prod
docker service update --force service_name
docker service logs -f prod_stt-app
docker swarm join --token SWMTKN-1-3u5uqmvfr2n2mc2vnvx0exi88l8ff9jgs6bar75s0h4nro81n6-7nqmbc2sfnl6k7tgfpbbf1101 192.168.10.170:2377


#docker
systemctl restart docker.service
sudo usermod -aG docker ${USER}
docker exec -u root -it tts bash


#logs
docker logs -f $(docker ps | grep 5030 | cut -c1-8)


#install gpu with docker
https://www.howtogeek.com/devops/how-to-use-an-nvidia-gpu-with-docker-containers/
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
&& curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
&& curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
apt-get update
apt-get install -y nvidia-docker2
sudo systemctl restart docker



#docker-slim
curl -sL https://raw.githubusercontent.com/slimtoolkit/slim/master/scripts/install-slim.sh | sudo -E bash -
#stable
curl -sL https://raw.githubusercontent.com/mintoolkit/mint/master/scripts/install-mint.sh | sudo -E bash -

slim update
slim build --target nginx:latest --tag nginx:slim --http-probe=true --expose=80;
slim lint --target /path/Dockerfile
slim xray --target kuda:v1
slim build --target kuda:v1 --tag kuda-stt:v1 --http-probe=true --expose=5030 --http-probe-retry-wait=400 --preserve-path-file=fixed.txt
slim build --cro-runtime=nvidia --target kuda:v1 --tag kuda-stt:v1 --http-probe=true --expose=5030 --http-probe-retry-wait=120 --preserve-path-file=fixed.txt 
mint build --show-clogs  --target fatwa-translation-translation-app:latest --tag translate:v1 --http-probe=true --expose=5030 --http-probe-start-wait=10 --http-probe-retry-wait=120 --http-probe-cmd-file=endpoints_translate.json
mint build --target hub.infostrategic.com/ai/ocr:v2 --tag ocr:v2 --http-probe=true --expose=8008 --http-probe-start-wait=60 --http-probe-retry-wait=120 --http-probe-cmd-file=cmd.json

#docker swarm with GPU
nvidia-smi -a | grep "GPU UUID"
in /etc/docker/daemon.json:
{
    "runtimes": {
        "nvidia": {
            "path": "/usr/bin/nvidia-container-runtime",
            "runtimeArgs": []
        }
    },
    "default-runtime": "nvidia",
    "node-generic-resources": [
        "NVIDIA-GPU=GPU-d8eaf8be-5e85-1a6d-6f9f-82fda3dbb7d1"
    ]
}
in /etc/nvidia-container-runtime/config.toml:
swarm-resource = "DOCKER_RESOURCE_NVIDIAGPU"
systemctl restart docker.service


#grype
curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b /usr/local/bin
grype python:3.10-slim | head
grype python:3.12 -o json | jq '.[] | select(.vulnerability.id == "CVE-2024-12254")'


systemctl daemon-reload
sudo systemctl restart docker
sudo systemctl restart docker.service



