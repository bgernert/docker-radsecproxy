# Radsecproxy Docker Container

## Goal of this image

This image provides a Radsecproxy in a Docker container.


## Configuration

All configuration is done by mouting /etc/radsecproxy.conf to a configuration file on the host system.

## Volumes

All Radsecproxy log files should be stored in '/var/log/radsecproxy' (via config file).
If you need to provide certificates, you may provide them through '/etc/radsecproxy/certs'.

## How to use the image

```
docker build -t docker-radsecproxy .
docker run -d \
  -v /path/to/certs:/etc/radsecproxy/certs \
  -v /pat/to/config/file:/etc/radsecproxy.conf:ro \
  -v /path/to/logfiles:/var/log/radsecproxy \
  docker-radsecproxy
```
