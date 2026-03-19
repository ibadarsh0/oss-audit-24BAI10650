#!/bin/bash

# Script 5: Open Source Manifesto Generator
# Author: Adarsh Bhardwaj | Course: Open Source Software

# -----------------------------------
# Introduction
# -----------------------------------
echo "=========================================="
echo " Open Source Manifesto Generator"
echo "=========================================="
echo ""
echo "Answer three questions to generate your manifesto."
echo ""

# -----------------------------------
# User Input
# -----------------------------------
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# -----------------------------------
# Variables
# -----------------------------------
DATE=$(date '+%d %B %Y')
USER_NAME=$(whoami)
OUTPUT="manifesto_${USER_NAME}.txt"

# -----------------------------------
# Create Manifesto (String Composition)
# -----------------------------------

echo "------------------------------------------" > "$OUTPUT"
echo "Open Source Manifesto" >> "$OUTPUT"
echo "Author: $USER_NAME" >> "$OUTPUT"
echo "Date: $DATE" >> "$OUTPUT"
echo "------------------------------------------" >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "I believe in the power of open-source software. Tools like $TOOL have become an essential part of my daily life, showing how collaborative development can create powerful solutions." >> "$OUTPUT"

echo "To me, freedom means $FREEDOM — the ability to learn, modify, and share knowledge without restrictions." >> "$OUTPUT"

echo "In the future, I aspire to build $BUILD and share it openly so that others can benefit, improve it, and contribute back to the community." >> "$OUTPUT"

echo "" >> "$OUTPUT"
echo "This is my small contribution to the open-source philosophy." >> "$OUTPUT"

# -----------------------------------
# Display Output
# -----------------------------------
echo ""
echo "✅ Manifesto saved to $OUTPUT"
echo ""
echo "---------- Your Manifesto ----------"
cat "$OUTPUT"
echo "------------------------------------"

