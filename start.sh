#! /bin/sh
set -e

# Start Radsecproxy
/sbin/radsecproxy -c /etc/radsecproxy.conf -i /var/run/radsecproxy.pid

# Keep container running
/usr/bin/tail -f /dev/null
