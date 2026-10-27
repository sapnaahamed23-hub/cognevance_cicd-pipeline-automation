
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

if ! curl --fail --silent --show-error "http://localhost:$PORT/health"; then
  echo "ERROR: Health check failed." >&2
  docker logs "$CONTAINER"
  exit 1
fi

echo ""
echo "Deployment completed successfully!"
docker ps --filter "name=$CONTAINER"
