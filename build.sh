#!/bin/bash
  
image="dplab/makercad-novnc"  
  
# Set the timestamp
timestamp=$(date +%Y.%m.%d.%H%M%S)  
  
tag=$image:$timestamp  
latest=$image:latest  
  
# Build the image -- tagged with the timestamp.
docker build -t $tag -t $latest .  
  
# Cleanup
#docker system prune -f

docker run --detach --volume=/home/debora/docker/slicer-data/:/configs/ --volume=/home/debora/docker/slicer-prints/:/prints/ -p 8080:8080 -e SSL_CERT_FILE="/etc/ssl/certs/ca-certificates.crt"  --name=makercad-novnc $tag
