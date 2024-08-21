#!/bin/bash

# Fixed image name
IMAGE_NAME="amarpreetsingh/opencbdc-tx-dev"
IMAGE_TAG="v1.1"

# Fixed host directory path
CONTAINER_DIR="/home/dev/work"

# Check if at least one argument is provided
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <host-dir:container-dir> [<host-dir:container-dir> ...] [--script <script-path>] [--name <container-name>]"
    exit 1
fi

# Initialize variables
MOUNTS=()
SCRIPT_PATH=""
CONTAINER_NAME=""

# Parse the arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --script)
            SCRIPT_PATH=$2
            shift 2
            ;;
        --name)
            CONTAINER_NAME=$2
            shift 2
            ;;
        *)
            MOUNTS+=("-v $1:$CONTAINER_DIR")
            shift
            ;;
    esac
done

if ! docker image inspect "$IMAGE_NAME:$IMAGE_TAG" &> /dev/null; then
    echo "Image $IMAGE_NAME:$IMAGE_TAG not found locally. Pulling from Docker Hub..."
    docker pull "$IMAGE_NAME:$IMAGE_TAG"
else
    echo "Image $IMAGE_NAME:$IMAGE_TAG already exists locally."
fi


# Construct the Docker run command
DOCKER_CMD="docker run --rm -it ${MOUNTS[@]} \
   -e LOCAL_USER_ID=$(id -u) \
   -e LOCAL_GROUP_ID=$(id -g)"	

# Add container name if provided
if [ -n "$CONTAINER_NAME" ]; then
    DOCKER_CMD="$DOCKER_CMD --name $CONTAINER_NAME"
fi

DOCKER_CMD="$DOCKER_CMD $IMAGE_NAME:$IMAGE_TAG"

# If a script is provided, append it to the Docker command
if [ -n "$SCRIPT_PATH" ]; then
    DOCKER_CMD="$DOCKER_CMD bash -c '$(cat $SCRIPT_PATH)'"
fi

# Execute the Docker command
echo "Running command: $DOCKER_CMD"
eval $DOCKER_CMD
