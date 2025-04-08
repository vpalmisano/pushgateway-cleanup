#!/bin/bash

last_pushed=$(printf "%.f" $(echo $1 | awk '{print $2}'))
job_name=$(echo $1 | \
        awk -F '}' '{print $1}' | \
        grep -o 'job=.*' | \
        cut -f1 -d ',' | \
        cut -f2 -d'=' | \
        tr -d '"')
std_unix_time_now=$(date +%s)
interval_seconds=$((std_unix_time_now - last_pushed))

if [ $interval_seconds -gt 60 ]; then
    curl -s -X DELETE ${PUSHGATEWAY_URL}/metrics/job/${job_name} && echo "${job_name} pushed ${interval_seconds} seconds ago, deleted"
fi
