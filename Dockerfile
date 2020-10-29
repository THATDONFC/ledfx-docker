# FROM python:3.7

# VOLUME /config
# WORKDIR /config

# RUN apt-get update && apt-get install -y \
#     portaudio19-dev \
#     python-pip \
#     gcc 

# RUN pip install ledfx

FROM python:3.7-alpine

VOLUME /config
WORKDIR /config

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

RUN pip3 install ledfx \
    && apk del --no-cache --purge .build-dependencies


COPY run.sh /run.sh
CMD ["/run.sh"]

EXPOSE 8888