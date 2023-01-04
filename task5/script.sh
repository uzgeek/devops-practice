#!/bin/bash

# Overloading server
for ((COUNT = 1; COUNT <= 100000; COUNT++)); do
    curl http://127.0.0.1:8080/?update_=$COUNT
done

# Download log file
cp /usr/local/var/log/nginx/access.log ./log.txt
