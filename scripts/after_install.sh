# ===== scripts/after_install.sh =====
#!/bin/bash
echo "Setting up application..."
cd /home/ec2-user/app
chown -R ec2-user:ec2-user /home/ec2-user/app

# Pull latest Docker image if using Docker Hub
if [ -f .env ]; then
    source .env
    docker pull $DOCKER_IMAGE || true
fi
