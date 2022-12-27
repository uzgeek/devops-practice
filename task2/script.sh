#!/bin/bash

function healthCheck() {
    code=$(curl --connect-timeout 0.5 --max-time 0.5 -w %{http_code} -s -o /dev/null https://google.com)

    if [[ "$code" -eq 200 ]]; then
        echo "Ok"
    else
        echo $(date "+%m/%d/%Y %T") | tee -a file.log
    fi

    sleep "$1"
}

while true; do
    healthCheck $(($RANDOM % 8 + 2))

done
