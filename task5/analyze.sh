#!/bin/bash

# Show all logs
cat log.txt

# Show all GET requests
awk '/GET/ {print}' log.txt

# Show all 404 responses
awk '$9==404 {print}' log.txt

# Show all requsts from Mozilla
awk '/Mozilla/ {print $12, $NF}' log.txt

# Show last 10 requests
tail -10 log.txt
