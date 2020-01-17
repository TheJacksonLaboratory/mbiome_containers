FROM alpine:latest

ENV app_version=2.12 \
    app_path=rdp_classifier_${app_version}

LABEL app.name="RDP Classifier v${app_version}"	\
      app.desc="Provides rapid taxonomic placement based on rRNA sequence data." \
      app.site="https://github.com/rdpstaff/classifier" \
      maintainer="B. Leopold, benjamin.leopold@jax.org"

WORKDIR /opt
RUN mkdir -p bin ${app_path}
ENV PATH "/opt/${app_path}:/opt/bin:$PATH"
RUN apk update && \
    apk add --no-cache \
        openjdk11-jre \
        wget \
        unzip

ENV app_url=https://downloads.sourceforge.net/project/rdp-classifier/rdp-classifier/rdp_classifier_${app_version}.zip \
    app_file=rdp_classifier_${app_version}.zip

# Install app
RUN wget ${app_url} -O ${app_file}&& \
    unzip ${app_file} && \
    rm -rf ${app_file}

ENV RDP_JAR "/opt/${app_path}/dist/classifier.jar"
ENTRYPOINT ["java -Xmx1g -jar ${RDP_JAR}"]
CMD ["--help"]
