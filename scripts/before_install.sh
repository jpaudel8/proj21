#!/bin/bash
echo "Cleaning up old application files..."
rm -rf /home/ec2-user/app/*
mkdir -p /home/ec2-user/app

# Ensure Docker is running
systemctl start docker
systemctl enable docker

# Install docker-compose if not present
if ! command -v docker-compose &> /dev/null; then
    curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
fi