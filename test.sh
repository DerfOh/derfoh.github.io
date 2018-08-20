#!/usr/bin/env bash

echo "HTTP Status code returned: "
curl -sL -w "%{http_code}\\n" "0.0.0.0:80" -o /dev/null
pwd
ls -lrt
