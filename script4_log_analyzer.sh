#!/bin/bash

# Script 4: Log File Analyzer
# Author: Adarsh Bhardwaj | Course: Open Source Software
# Usage: bash script4_log_analyzer.sh logfile.txt [keyword]

# -----------------------------------
# Input Arguments
# -----------------------------------
LOGFILE=$1
KEYWORD=${2:-"error"}   # Default keyword is 'error'
COUNT=0

echo "=========================================="
echo "   Log File Analyzer (Adarsh)"
echo "=========================================="

# -----------------------------------
# Check if file exists
# -----------------------------------
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    exit 1
fi

# -----------------------------------
# Do-while style check (retry if empty)
# -----------------------------------
ATTEMPT=1

while true; do
    if [ ! -s "$LOGFILE" ]; then
        echo "Warning: File is empty (Attempt $ATTEMPT)"
        echo "Please add content to the file..."

        ATTEMPT=$((ATTEMPT + 1))

        # Limit retry to avoid infinite loop
        if [ $ATTEMPT -gt 2 ]; then
            echo "Exiting after multiple empty checks."
            exit 1
        fi

        sleep 2
    else
        break
    fi
done

# -----------------------------------
# Read file line by line
# -----------------------------------
while IFS= read -r LINE; do

    # Check if keyword exists (case-insensitive)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi

done < "$LOGFILE"

# -----------------------------------
# Output Summary
# -----------------------------------
echo ""
echo "Keyword '$KEYWORD' found $COUNT times in file: $LOGFILE"

# -----------------------------------
# Show last 5 matching lines
# -----------------------------------
echo ""
echo "Last 5 matching lines:"
grep -i "$KEYWORD" "$LOGFILE" | tail -5

echo "=========================================="
echo "Analysis done by: Adarsh Bhardwaj"
echo "=========================================="