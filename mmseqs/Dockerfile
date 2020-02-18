FROM alpine:latest

ENV app_name mmseqs
ARG app_vers=latest
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

ENV app_url=https://mmseqs.com/${app_vers} \
    app_file=mmseqs-linux-avx2.tar.gz

# install latest release:
RUN curl -SL ${app_url}/${app_file} \
    | tar xzC ${app_path}

ENTRYPOINT ["mmseqs"]
CMD ["-h"]
