# Create docker image from python3.7-slim
FROM python:3.7-slim

# Create python venv and add it to PATH
RUN python -m venv /ledfx/venv
ENV PATH="/ledfx/venv/bin:$PATH"

# Install dependencies and ledfx, remove uneeded packages
RUN apt-get update && apt-get install -y --no-install-recommends \
        gcc \
        libc-dev \
    && apt-get install -y \
        alsa-utils \
        libasound2 \
        libasound2-plugins \
        portaudio19-dev \
        pulseaudio \
    && pip install ledfx-dev \
    && apt-get purge -y gcc libc-dev \
    && apt-get clean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# Add user `ledfx` and create home folder
RUN useradd --create-home ledfx
# Set the working directory in the container
WORKDIR /home/ledfx
USER ledfx

# Expose port 8888 for web server and 5353 for mDNS discovery
EXPOSE 8888/tcp
EXPOSE 5353/udp
ENTRYPOINT [ "ledfx"]
#CMD ["--host 0.0.0.0","--port 8888"]