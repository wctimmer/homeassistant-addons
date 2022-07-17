
ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install Packages 
RUN apk update 
RUN apk add --no-cache  cups cups-filters cups-client cups-libs cups-dev
RUN apk add --no-cache ghostscript  
RUN apk add --no-cache build-base wget rsync binutils psutils whois python3 python3-dev py3-pip 
RUN apk add --no-cache avahi iptables dbus inotify-tools

RUN pip3 --no-cache-dir install --upgrade pip && pip3 install pycups && rm -rf /var/cache/apk/*


#Add nginx and create the run folder for nginx.
RUN \
  apk --no-cache add \
    nginx \
  \
  && mkdir -p /run/nginx


COPY rootfs /


# Baked-in config file changes
RUN sed -i 's/Listen localhost:631/Listen 0.0.0.0:631/' /etc/cups/cupsd.conf && \
	sed -i 's/Browsing Off/Browsing On/' /etc/cups/cupsd.conf && \
	sed -i 's/<Location \/>/<Location \/>\n  Allow All/' /etc/cups/cupsd.conf && \
	sed -i 's/<Location \/admin>/<Location \/admin>\n  Allow All\n  Require user @SYSTEM/' /etc/cups/cupsd.conf && \
	sed -i 's/<Location \/admin\/conf>/<Location \/admin\/conf>\n  Allow All/' /etc/cups/cupsd.conf && \
	sed -i 's/.*enable\-dbus=.*/enable\-dbus\=no/' /etc/avahi/avahi-daemon.conf && \
	echo "ServerAlias *" >> /etc/cups/cupsd.conf && \
	echo "DefaultEncryption Never" >> /etc/cups/cupsd.conf
