#! /bin/bash

# Retrieve current temperature with the help of DarkSky API.
# Set these environment variables before running script:
# - DARKSKY_API_KEY
# - SOUND_FILEPATH
# This env var has a default, but can be overridden:
# - LAT_LON_COORDS
# And finally, pass in the setpoint temperature at which the alert should be
# triggered. Alert is triggered when the outside temperature is below the
# setpoint.
# ./weather-alert <TEMPERATURE SETPOINT>
#
# Powered by Dark Sky (https://darksky.net/poweredby/).

if [ $# -eq 1 ]; then
    TEMP_SETPOINT=$1
else 
    TEMP_SETPOINT="${TEMP_SETPOINT:-78}"
fi

LAT_LON_COORDS=${LAT_LON_COORDS:-"45.5151,-122.6795"}
SOUND_FILEPATH=${SOUND_FILEPATH:-"/path/to/sound/file/alert.mp3"}

printf "The sound %s will play" "${SOUND_FILEPATH}" 
printf "\nwhen the temperature is below %s" "${TEMP_SETPOINT}"
printf "\nat the location coordinates of %s.\n"  "${LAT_LON_COORDS}"
printf "\n=====  This app is powered by Dark Sky (https://darksky.net/poweredby/) ===== \n"

if [ -z $DARKSKY_API_KEY ]; then
    printf "DarkSky API Key required. Exiting.\n";
    exit 1;
fi

http_request="https://api.darksky.net/forecast/${DARKSKY_API_KEY}/${LAT_LON_COORDS}?exclude=minutely,hourly,daily,flags"
curr_temp=$(curl --no-progress-meter -G $http_request | jq '.currently.temperature')

until (( $(echo "${curr_temp}<${TEMP_SETPOINT}" | bc -l) )); do
    printf "\n[%s] The current temperature %s is greater than the setpoint %s.\n" "$(date +"%Y-%m-%d %T")" "${curr_temp}" "${TEMP_SETPOINT}"
    printf "Wait 2 minutes to check again.\n"
    sleep 120
    curr_temp=$(curl --no-progress-meter -G $http_request | jq '.currently.temperature')
done

printf "\n[%s] Current temperature %s is lower than the setpoint %s.\n" "$(date +"%Y-%m-%d %T")" "${curr_temp}" "${TEMP_SETPOINT}"
cvlc -q --play-and-exit "${SOUND_FILEPATH}" &> /dev/null
exit 0
