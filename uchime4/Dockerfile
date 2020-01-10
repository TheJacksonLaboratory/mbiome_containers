FROM alpine:latest

ENV app_version 4.2.40

LABEL AppName="uchime v${app_version}"
LABEL AppDesc="uchime v${app_version} is donated to the public domain. \
                Removes chimera sequences, outputs to two files \
                and streams remaining sequences to stdout."
LABEL Maintainer="B. Leopold, benjamin.leopold@jax.org"

WORKDIR /opt/bin
RUN apk update && \
    apk add --no-cache \
        curl

# Public domain version of uchime
ADD https://drive5.com/uchime/uchime4.2.40_i86linux32 ./
# Uchime's recommended ChimeraSlayer database
ADD http://drive5.com/uchime/gold.fa ./

RUN mv uchime4.2.40_i86linux32 uchime
RUN chmod +x uchime

ENV PATH "/opt/bin:$PATH"
ENTRYPOINT uchime
