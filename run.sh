#!/usr/bin/env bash

# Simple launcher for 3 cross-origin test servers using npx serve

# Exit on error
set -e

# Create directories if they don't exist
mkdir -p publisher_site outer_site creative_site

# Start the servers
echo "Starting servers..."

# Serve publisher on port 8080
npx serve publisher_site -l 8080 &
PID1=$!

# Serve outer (Google-like) iframe on port 8081
npx serve outer_site -l 8081 &
PID2=$!

# Serve creative (ad iframe) on port 8082
npx serve creative_site -l 8082 &
PID3=$!

echo "Publisher: http://127.0.0.1:8080"
echo "Outer iframe: http://127.0.0.1:8081"
echo "Creative iframe: http://127.0.0.1:8082"
echo
echo "Servers running. Press Ctrl+C to stop."

# Keep script running until manually stopped
wait $PID1 $PID2 $PID3
