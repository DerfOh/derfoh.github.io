#!/usr/bin/env bash

pwd
ls -lrt
ps -ef
/sbin/my_init >> /dev/null
echo "HTTP Status code returned: "
curl -sL -w "%{http_code}\\n" "0.0.0.0:80" -o /dev/null