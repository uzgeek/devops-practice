#!/bin/bash

source .env
for location in "Tashkent" "Moscow" "New-York"; do

    geo_url="http://api.openweathermap.org/geo/1.0/direct?q=$location&&appid=$API_KEY"
    latitude=$(curl "$geo_url" | jq '.[] | .lat')
    longitude=$(curl "$geo_url" | jq '.[] | .lon')

    weather_url="http://www.7timer.info/bin/api.pl?lon=$longitude&lat=$latitude&product=astro&output=json"
    weather=$(curl -w -o "$weather_url" | grep temp2m)

    echo $location $weather
done
