
# ===== scripts/start_application.sh =====
#!/bin/bash
echo "Starting application..."
cd /home/ec2-user/app

# Start using docker-compose if available
if [ -f docker-compose.yml ]; then
    docker-compose up -d
elif [ -f Dockerfile ]; then
    docker build -t myapp:latest .
    docker run -d -p 80:80 --name myapp myapp:latest
else
    echo "No Docker configuration found"
    exit 1
fi
