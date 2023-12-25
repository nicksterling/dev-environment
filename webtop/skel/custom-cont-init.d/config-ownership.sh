#!/bin/bash

# There are a number of directories and files that need to be owned by abc
#  in order for the container to run properly. This script will check for
#  the existence of those directories and files and create them if they
#  don't exist. It will also change the ownership of those directories and
#  files to abc.

# If /config/.config/dconf does not exist, create it
if [ ! -d "/config/.config/dconf" ]; then
    echo "Creating /config/.config/dconf directory"
    mkdir -p "/config/.config/dconf"
    if [ $? -ne 0 ]; then
        echo "Failed to create /config/.config/dconf directory"
        exit 1
    fi

    # Copy the user file to the new location if it doesn't exist
    if [ ! -f "/config/.config/dconf/user" ]; then
        echo "Copying user file"
        cp "/backup/user" "/config/.config/dconf/user"
        if [ $? -ne 0 ]; then
            echo "Failed to copy user file"
            exit 1
        fi
    fi    

    # Change the ownership of the new directory and file
    echo "Changing ownership of /config/.config/dconf"
    chown -R abc:abc "/config/.config/dconf"
    if [ $? -ne 0 ]; then
        echo "Failed to change ownership of /config/.config/dconf"
        exit 1
    fi
fi

# If /config/.cache does not exist, create it
if [ ! -d "/config/.cache" ]; then
    echo "Creating /config/.cache directory"
    mkdir -p "/config/.cache"
    if [ $? -ne 0 ]; then
        echo "Failed to create /config/.cache directory"
        exit 1
    fi
fi

# Change the ownership of the new directory
echo "Changing ownership of /config/.cache"
chown -R abc:abc "/config/.cache"
if [ $? -ne 0 ]; then
    echo "Failed to change ownership of /config/.cache"
    exit 1
fi