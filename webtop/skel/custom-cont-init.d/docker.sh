#!/bin/bash

# This script customizes how docker is run on a webtop image. By default,
#  docker is run with the overlay2 filesystem. Overlay filesystems can 
#  cause issues when running things like K8s inside of docker. This script
#  will allow you to run docker with a different filesystem like ext4.

# Check the environment variable DOCKER_FILESYSTEM to see what filesystem to use
# for the docker image
echo "******* Configuring Docker *******"
if [ -z "$DOCKER_FILESYSTEM" ]; then
    echo "Error: DOCKER_FILESYSTEM environment variable not set"
    exit 1
fi

# Check the environment variable DOCKER_MOUNT_POINT to see where to mount the
# docker image
if [ -z "$DOCKER_MOUNT_POINT" ]; then
    DOCKER_MOUNT_POINT=/opt/docker
fi

# Check the environment variable DOCKER_FILESYSTEM_SIZE to see what size to
# create the filesystem
if [ -z "$DOCKER_FILESYSTEM_SIZE" ]; then
    DOCKER_FILESYSTEM_SIZE=100G
fi

# Print off the DOCKER_FILESYSTEM environment variable
echo "DOCKER_FILESYSTEM: $DOCKER_FILESYSTEM"

case $DOCKER_FILESYSTEM in
    ext4)
        echo "We have ext4!"
        # Check to see if docker.img exists in $DOCKER_MOUNT_POINT
        if [ ! -f $DOCKER_MOUNT_POINT/docker.img ]; then
            mkdir -p $DOCKER_MOUNT_POINT
            chown -R abc:abc $DOCKER_MOUNT_POINT
            # If not, create it
            sudo -u abc truncate -s $DOCKER_FILESYSTEM_SIZE $DOCKER_MOUNT_POINT/docker.img
            # Create an ext4 filesystem on it
            mkfs.ext4 -F $DOCKER_MOUNT_POINT/docker.img
        fi

        # Create the docker directory if it doesn't exist
        mkdir -p /var/lib/docker

        # Mount it
        mount -o loop $DOCKER_MOUNT_POINT/docker.img /var/lib/docker

        # Manually run the docker service and pipe the output to a log file
        sudo /usr/local/bin/dockerd-entrypoint.sh &> $DOCKER_MOUNT_POINT/docker.log &
        ;;
    *)
        echo "Error: Unsupported filesystem type: $DOCKER_FILESYSTEM"
        exit 1
        ;;
esac
