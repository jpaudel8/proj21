#!/bin/bash
echo "Stopping application..."
cd /home/ec2-user/app
if [ -f docker-compose.yml ]; then
    docker-compose down || true
fi
docker stop $(docker ps -aq) 2>/dev/null || true