#!/usr/bin/env bash


curl -sL -w "%{http_code}\\n" "localhost:80" -o /dev/null
