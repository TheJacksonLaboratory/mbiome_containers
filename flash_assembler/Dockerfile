FROM alpine:latest

ENV app_name flash
ARG app_version=1.2.11
ENV app_path FLASH-${app_version}

LABEL app.name "FLASH v${app_version}" \
      app.desc "FLASH (Fast Length Adjustment of SHort reads). \
                Paired sequence assembler by merging sequence overlaps." \
      app.site "https://sourceforge.net/projects/flashpage" \
      maintainer "B. Leopold, benjamin.leopold@jax.org"

WORKDIR /opt
ENV PATH "/opt/${app_path}:$PATH"

RUN apk update && \
    apk add --no-cache \
        wget \
        tar \
        zlib-dev \
        build-base

ENV app_url=https://sourceforge.net/projects/flashpage/files/FLASH-${app_version}.tar.gz/download \
    app_file=FLASH-${app_version}.tar.gz

# Install app
RUN wget ${app_url} -O ${app_file} && \
    tar xzvf ${app_file} && \
    rm -f ${app_file} && \
    cd ${app_path} && \
    make

ENTRYPOINT ["flash"]
CMD ["--help"]
