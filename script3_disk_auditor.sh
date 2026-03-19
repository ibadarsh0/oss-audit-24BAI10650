#!/bin/bash

# Script 3: Disk and Permission Auditor
# Author: Adarsh Bhardwaj | Course: Open Source Software

# -----------------------------------
# Important Directories to Check
# -----------------------------------
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "=========================================="
echo "   Directory Audit Report (Adarsh)"
echo "=========================================="
echo ""

# -----------------------------------
# Loop through directories
# -----------------------------------
for DIR in "${DIRS[@]}"; do

    if [ -d "$DIR" ]; then

        # Extract permissions, owner, group
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')

        # Extract size (human readable)
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        echo "Directory: $DIR"
        echo " -> Permissions & Owner: $PERMS"
        echo " -> Size Used          : $SIZE"
        echo "------------------------------------------"

    else
        echo "Directory: $DIR not found on this system"
        echo "------------------------------------------"
    fi

done

# -----------------------------------
# Extra Section: Software Config Check
# (Using Git as chosen software)
# -----------------------------------

echo ""
echo "Checking configuration directory for Git..."

CONFIG_DIR="$HOME/.gitconfig"

if [ -e "$CONFIG_DIR" ]; then
    CONFIG_INFO=$(ls -ld "$CONFIG_DIR" | awk '{print $1, $3, $4}')
    echo "Git config file found!"
    echo " -> Permissions & Owner: $CONFIG_INFO"
else
    echo "Git config file not found in home directory."
fi

echo "=========================================="
echo "Audit completed by: Adarsh Bhardwaj"
echo "=========================================="