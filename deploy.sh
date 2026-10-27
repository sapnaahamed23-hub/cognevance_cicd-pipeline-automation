
#!/bin/bash
set -e

IMAGE="sapnaahamed/cicd-pipeline-automation:latest"
CONTAINER="cicd-app"
PORT="5000"

echo "Pulling the latest Docker image..."
docker pull "$IMAGE"

echo "Removing the previous container if it exists..."
docker rm -f "$CONTAINER" 2>/dev/null || true

echo "Starting the application..."
docker run -d \
  --name "$CONTAINER" \
  --restart unless-stopped \
  -p "$PORT:5000" \
  "$IMAGE"

echo "Checking application health..."
sleep 3
curl --fail "http://localhost:$PORT/health"

echo ""
echo "Deployment completed successfully!"
docker ps --filter "name=$CONTAINER"
