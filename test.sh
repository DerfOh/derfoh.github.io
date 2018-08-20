#!/usr/bin/env bash

jekyll serve -B

echo "HTTP Status code returned: "
curl -sL -w "%{http_code}\\n" "0.0.0.0:4000" -o /dev/null 