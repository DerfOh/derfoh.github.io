#!/usr/bin/env bash

echo "HTTP Status code returned: "
curl -sL -w "%{http_code}\\n" "localhost:80" -o /dev/null
