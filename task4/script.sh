#!/bin/bash

for location in "Tashkent" "Moscow" "New-York"; do

    geo_url="http://api.openweathermap.org/geo/1.0/direct?q=$location&&appid=3e924651582150c51ffce9692fbb9d90"
    latitude=$(curl "$geo_url" | jq '.[] | .lat')
    longitude=$(curl "$geo_url" | jq '.[] | .lon')

    weather_url="http://www.7timer.info/bin/api.pl?lon=$longitude&lat=$latitude&product=astro&output=json"
    weather=$(curl "$weather_url" | jq '.[] | .temp2m')

    echo $weather
done
