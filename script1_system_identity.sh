#!/bin/bash

# Script 1: System Identity Report
# Author: Adarsh Bhardwaj | Course: Open Source Software

# -----------------------------------
# Variables (Student Information)
# -----------------------------------
STUDENT_NAME="Adarsh Bhardwaj"              
SOFTWARE_CHOICE="Linux Kernel (GPL v2)"    

# -----------------------------------
# System Information Collection
# -----------------------------------

# Kernel version
KERNEL=$(uname -r)

# Logged-in user
USER_NAME=$(whoami)

# Home directory
HOME_DIR=$HOME

# System uptime (human-readable)
UPTIME=$(uptime -p)

# Current date and time
CURRENT_DATE=$(date)

# Linux distribution name
DISTRO=$(lsb_release -d 2>/dev/null | cut -f2)

# Fallback if lsb_release is not available
if [ -z "$DISTRO" ]; then
    DISTRO=$(grep PRETTY_NAME /etc/os-release | cut -d '"' -f2)
fi

# -----------------------------------
# Display Output (Formatted)
# -----------------------------------

echo "=============================================="
echo "     Open Source Audit — $STUDENT_NAME"
echo "=============================================="

echo "Linux Distro  : $DISTRO"
echo "Kernel        : $KERNEL"
echo "User          : $USER_NAME"
echo "Home Directory: $HOME_DIR"
echo "Uptime        : $UPTIME"
echo "Date & Time   : $CURRENT_DATE"

echo "----------------------------------------------"

echo "Chosen Software: $SOFTWARE_CHOICE"

echo "----------------------------------------------"

# Open-source license message
echo "This system is built on the Linux Kernel."
echo "It is licensed under the GNU General Public License v2 (GPL v2)."

echo "=============================================="