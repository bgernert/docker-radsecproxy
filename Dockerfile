# Use official Debian release
FROM debian:stretch-slim

# Maintainer
LABEL maintainer="Björn Gernert <mail@bjoern-gernert.de>"

# Update Debian image
RUN apt-get -qq update && apt-get -qq upgrade

# Install Radsecproxy Server
RUN apt-get -qq install radsecproxy

# Clean up updates/install
RUN apt-get -qq autoclean && apt-get -qq autoremove && apt-get -qq clean

# Create Radsecproxy logging and certs dir
RUN mkdir /var/log/radsecproxy
RUN mkdir -p /etc/radsecproxy/certs

# Export volumes
VOLUME /var/log/redsecproxy

# Make Radsecproxy's ports available
EXPOSE 1812
EXPOSE 1813

# Add Tini
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

# Start Radsecproxy
CMD ["/usr/sbin/radsecproxy", "-f", "-c", "/etc/radsecproxy.conf"]