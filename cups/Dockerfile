
ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install Packages 
RUN apk update 
RUN apk add --no-cache  cups cups-filters cups-client cups-libs cups-dev
RUN apk add --no-cache ghostscript brlaser 
RUN apk add --no-cache build-base wget rsync binutils psutils whois python3 python3-dev py3-pip 
RUN apk add --no-cache avahi iptables inotify-tools openrc

RUN pip3 --no-cache-dir install --upgrade pip && pip3 install pycups && rm -rf /var/cache/apk/*


RUN rm -Rf /etc/avahi/services/*
COPY rootfs /
