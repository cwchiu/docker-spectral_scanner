FROM ubuntu:20.04 AS downloader

RUN apt update && apt install -y curl
RUN curl -L 'https://get.spectralops.io/latest/x/sh' | sh

FROM ubuntu:20.04 

COPY --from=downloader /root/.spectral/spectral /usr/bin/spectral
RUN apt-get update && apt-get install -y git
