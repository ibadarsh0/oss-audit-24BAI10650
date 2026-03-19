#!/bin/bash

# Script 2: FOSS Package Inspector
# Author: Adarsh Bhardwaj | Course: Open Source Software

# -----------------------------------
# Package to check (you can change it)
# -----------------------------------
PACKAGE="git"

echo "Checking package: $PACKAGE"
echo "-----------------------------------"

# -----------------------------------
# Check if dpkg exists (Ubuntu/Debian)
# -----------------------------------
if command -v dpkg >/dev/null 2>&1; then

    # Check installation using dpkg
    if dpkg -l | grep -w "$PACKAGE" >/dev/null 2>&1; then
        echo "$PACKAGE is installed on this system."

        # Show version and details
        dpkg -l | grep -w "$PACKAGE"
    else
        echo "$PACKAGE is NOT installed on this system."
    fi

# -----------------------------------
# Otherwise check rpm (RedHat-based)
# -----------------------------------
elif command -v rpm >/dev/null 2>&1; then

    if rpm -q "$PACKAGE" >/dev/null 2>&1; then
        echo "$PACKAGE is installed on this system."

        # Extract useful info
        rpm -qi "$PACKAGE" | grep -E 'Version|License|Summary'
    else
        echo "$PACKAGE is NOT installed on this system."
    fi

else
    echo "No supported package manager found."
fi

echo "-----------------------------------"

# -----------------------------------
# Case statement (software meaning)
# -----------------------------------
case $PACKAGE in
    git)
        echo "Git: a version control system created by Linus Torvalds for efficient collaboration"
        ;;
    firefox)
        echo "Firefox: an open-source browser focused on privacy and user freedom"
        ;;
    vlc)
        echo "VLC: a media player that can run almost any audio/video format"
        ;;
    mysql)
        echo "MySQL: a popular open-source database used in many applications"
        ;;
    apache2|httpd)
        echo "Apache: a powerful web server that helped build the modern internet"
        ;;
    *)
        echo "This package is open-source software contributing to the Linux ecosystem."
        ;;
esac

echo "-----------------------------------"
echo "Checked by: Adarsh Bhardwaj"