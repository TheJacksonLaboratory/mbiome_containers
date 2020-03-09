FROM alpine:latest

ENV app_name mmseqs
ARG app_vers=11-e1a1c
ENV app_path ${app_name}

LABEL app.name="mmseqs2" \
      app.desc="MMseqs2 (Many against Many sequence searching) is an \
                open-source software suite for very fast, parallelized protein \
                sequence searches and clustering of huge protein sequence data sets." \
      app.site="https://mmseqs.com" \
      maintainer="B. Leopold, benjamin.leopold@jax.org"

WORKDIR /opt
ENV PATH "/opt/${app_path}/bin:$PATH"
RUN apk update && \
    apk add --no-cache \
        curl \
        tar \
        bash

ENV app_url=https://github.com/soedinglab/MMseqs2/releases/download/${app_vers} \
    app_file=MMseqs2-Linux-AVX2.tar.gz

# install latest release:
RUN curl -SL ${app_url}/${app_file} \
    | tar xz

ENTRYPOINT ["mmseqs"]
CMD ["-h"]
