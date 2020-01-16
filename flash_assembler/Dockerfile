FROM alpine:latest

ARG app_version
ENV app_version ${app_version:-1.2.11}
ENV app_path FLASH-${app_version}

LABEL AppName "FLASH v${app_version}"
LABEL AppDesc "FLASH (Fast Length Adjustment of SHort reads). \
                Paired sequence assembler by merging sequence overlaps."
LABEL AppSite "https://sourceforge.net/projects/flashpage"
LABEL Maintainer "B. Leopold, benjamin.leopold@jax.org"

WORKDIR /opt
RUN mkdir -p /opt/bin
RUN mkdir -p ${app_path}
ENV PATH "/opt/${app_path}:/opt/bin:$PATH"

RUN apk update && \
    apk add --no-cache \
        wget \
        tar \
        bash \
        zlib-dev \
        build-base

ENV app_url  https://sourceforge.net/projects/flashpage/files/FLASH-${app_version}.tar.gz/download
ENV app_file FLASH-${app_version}.tar.gz

# Install app
RUN wget ${app_url} -O ${app_file}
RUN tar xzvf ${app_file} && \
    rm -f ${app_file} && \
    cd ${app_path} && \
    make

ENTRYPOINT flash
