#!/bin/bash

while true; do
    code=$(curl -m 1 -w %{http_code} -s -o /dev/null https://google.com)

    if [[ "$code" -eq 200 ]]; then
        echo "Ok"
    else
        echo "Not Ok"
    fi

    sleep 5
done
