FROM alpine:latest

ENV app_name rdp_classifier
ENV app_version 2.12
ENV app_path ${app_name}_${app_version}

LABEL app.name="RDP Classifier v${app_version}"	\
      app.desc="Provides rapid taxonomic placement based on rRNA sequence data." \
      app.site="https://github.com/rdpstaff/classifier" \
      maintainer="B. Leopold, benjamin.leopold@jax.org"

WORKDIR /opt
ENV PATH "/opt/${app_path}:/usr/lib/jvm/java-11-openjdk/bin:$PATH"
RUN apk update && \
    apk add --no-cache \
        openjdk11-jdk \
        curl \
        bash

ENV app_url=https://downloads.sourceforge.net/project/rdp-classifier/rdp-classifier \
    app_file=rdp_classifier_${app_version}.zip \
    app_jar="/opt/${app_path}/dist/classifier.jar"

# Install app
RUN curl -L ${app_url}/${app_file}  | jar xv ${app_path}/dist/

RUN echo -e \
    "#!/bin/sh\njava -Xmx4096m -jar ${app_jar} classify" \
    > /usr/bin/${app_name} && \
    chmod +x /usr/bin/${app_name}

ENTRYPOINT ["rdp_classifier"]
CMD ["--help"]
