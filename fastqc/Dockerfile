FROM alpine:latest

ARG app_version
ENV app_version=${app_version:-0.11.9} \
    app_path=FastQC

LABEL app.name="FastQC v${app_version}" \
      app.desc="FastQC - A Quality Control application for FastQ files" \
      app.site="http://www.bioinformatics.babraham.ac.uk/projects/fastqc/" \
      maintainer="B. Leopold, benjamin.leopold@jax.org"

WORKDIR /opt/
ENV PATH "/opt/${app_path}:$PATH"

RUN apk update && \
    apk add --no-cache \
      openjdk11-jre \
      perl \
      unzip

ENV app_url=http://www.bioinformatics.babraham.ac.uk/projects/fastqc \
    app_file=fastqc_v${app_version}.zip

ADD ${app_url}/${app_file} ./

# Install FastQC
RUN unzip ${app_file} && \
    rm -rf ${app_file} && \
    chmod +x ${app_path}/fastqc

ENTRYPOINT ["fastqc"]
CMD ["--help"]
