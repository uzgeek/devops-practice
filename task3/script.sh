#!/bin/bash

function healthCheck() {
    code=$(curl --connect-timeout 0.5 --max-time 0.5 -w %{http_code} -s -o /dev/null "$1")

    if [[ "$code" -eq 200 ]]; then
        echo "Ok"
    else
        echo "$1 $(date "+%m/%d/%Y %T")" | tee -a file.log
    fi

    sleep "$2"
}

while true; do
    while read url; do
        healthCheck $url, $(($RANDOM % 8 + 2))
    done <urls.txt

done
