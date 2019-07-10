#! /bin/sh
set -e

# Start Radsecproxy
/sbin/radsecproxy -f -c /etc/radsecproxy.conf -i /var/run/radsecproxy.pid
