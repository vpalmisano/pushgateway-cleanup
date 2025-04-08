#!/bin/bash

echo "Starting cleanup script (url: ${PUSHGATEWAY_URL}, timeout: ${PUSHGATEWAY_TIMEOUT})."
while true; do
    curl -s ${PUSHGATEWAY_URL}/metrics | grep -E ^push_time_seconds | xargs -I {} /cleanup.sh {}
    sleep 60
done
echo "Cleanup script exiting."
