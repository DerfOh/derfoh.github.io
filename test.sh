#!/usr/bin/env bash


curl -sL -w "%{http_code}\\n" "localhost:8918" -o /dev/null
