FROM alpine
FROM python:3.7

VOLUME ["/config"]

RUN apt-get update && apt-get install -y \
    portaudio19-dev \
    python-pip && \
    pip install ledfx

EXPOSE 8888/tcp

COPY run.sh /run.sh

CMD ["/run.sh"]