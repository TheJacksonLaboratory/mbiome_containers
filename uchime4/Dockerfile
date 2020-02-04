FROM alpine:latest

ENV app_version 4.2.40

LABEL app.name="uchime v${app_version}" \
      app.desc="uchime v${app_version} is donated to the public domain. \
                Removes chimera sequences, outputs to two files \
                and streams remaining sequences to stdout." \
      maintainer="B. Leopold, benjamin.leopold@jax.org"

WORKDIR /opt/bin
ENV PATH "/opt/bin:$PATH"
RUN apk add --no-cache bash

# Public domain version of uchime
# and Uchime's recommended ChimeraSlayer database
ADD https://drive5.com/uchime/uchime4.2.40_i86linux32 \
    https://drive5.com/uchime/gold.fa ./

RUN mv uchime4.2.40_i86linux32 uchime && \
    chmod +x uchime

ENTRYPOINT ["uchime"]
CMD ["--version"]
