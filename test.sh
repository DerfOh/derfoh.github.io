#!/usr/bin/env bash

echo "Waiting 30 seconds for service to come up..."
sleep 30

echo "HTTP Status code returned: "
curl -sL -w "%{http_code}\\n" "0.0.0.0:80" -o /dev/null 