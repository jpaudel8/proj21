
# ===== scripts/validate_service.sh =====
#!/bin/bash
echo "Validating service..."
sleep 10

# Check if container is running
CONTAINER_COUNT=$(docker ps | grep -v CONTAINER | wc -l)
if [ $CONTAINER_COUNT -gt 0 ]; then
    echo "Application is running"
    
    # Optional: Check if application responds
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:80 || echo "000")
    if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "301" ] || [ "$HTTP_CODE" = "302" ]; then
        echo "Application is responding correctly"
        exit 0
    else
        echo "Application returned HTTP $HTTP_CODE"
        exit 1
    fi
else
    echo "No containers running"
    exit 1
fi