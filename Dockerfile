FROM python:3.6-alpine

VOLUME /config
WORKDIR /config
RUN apk update
RUN apk add py3-pip
RUN \
    apk add --no-cache --virtual .build-dependencies \
        cython \
        g++ \
        gcc \
        gfortran \
    && apk add --no-cache \
        alsa-utils \
        alsa-utils-doc \
        alsa-lib \
        alsaconf \
        alsa-plugins-pulse \
        lua-resty-http \
        portaudio-dev  
        
ADD ledfx-dev /tmp/ledfx-dev
RUN cd /tmp/ledfx-dev && pip install -v -e . \
    && apk del --no-cache --purge .build-dependencies
EXPOSE 8888/tcp
ENTRYPOINT [ "ledfx"]