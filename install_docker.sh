#!/bin/bash

# Update the package list and install dependencies
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y

# Add the Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add the Docker repository to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update the package list again
sudo apt-get update

# Install Docker
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# Verify that Docker is installed and running
sudo docker run hello-world


DB_HOST=sql-server
DB_PORT=1433
DB_DATABASE=lcp_em
DB_USER=lcpproject
DB_PASS_FOR_SERVER=7Y9jPJpUESMzXrKYDr$$F
DB_PASS=7Y9jPJpUESMzXrKYDr$$F
BASE_URL=http://localhost:8081
SERVER_PORT=8081
SECRET_KEY=7cd89a4694a1b7bba3e8dbf9af967f4f172d373b3c5c0a4e1a78f72f263a52366d8c7e8c378804df23d7aa0f914ecef6bb942d7ba9c012f00709baefe0b49f89
MULTIPART_LOCATION=./inetpub/
CHECK_IN_DOMAIN=lcp-mgm-k.infostrategic.com
CAMUNDA_DOMAIN=https://lcp-mgm-k.infostrategic.com
ENABLE_PASSWORD_POLICY=Y
SERVER_DOMAIN=lcp-mgm-k.infostrategic.com
SQL_DIRECTORY_PATH=/lcp02/inetpub/appSqlFiles
IMG_URL=https://lcp-mgm-k.infostrategic.com/
JITSI_SECRET=vukT8ac8QrXsUXwDDoTl73StBwTemx33lF65pshsy+7hIAPMNcXfW8R7yQGZq1d6
JOB_LOCKER_KEY=camunda-server-pmo-110
CLIENT_SECRET=AezPqdRCXyedUNKGatmVUewDcfGUHKT5
FILE_MULTIPART_LOCATION=./inetpub/