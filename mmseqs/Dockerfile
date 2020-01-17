FROM alpine:latest

ENV app_version=latest \
    app_path=mmseqs

LABEL app.name="mmseqs" \
      app.desc="MMseqs2: ultra fast and sensitive protein search and clustering suite" \
      app.url="https://github.com/soedinglab/mmseqs2" \
      maintainer="B. Leopold, benjamin.leopold@jax.org"

WORKDIR /opt
ENV PATH "/opt/${app_path}/bin:/opt/bin:$PATH"
RUN apk update && \
    apk add --no-cache \
        wget \
        tar

ENV app_url=https://mmseqs.com/latest \
    app_file=mmseqs-linux-avx2.tar.gz

# install latest release:
RUN wget ${app_url}/${app_file} && \
    tar xvzf ${app_file}

ENTRYPOINT ["mmseqs"]
