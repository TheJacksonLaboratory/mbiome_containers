FROM alpine:latest

ENV app_name trimmomatic
ARG app_version=0.39
ENV app_path Trimmomatic-${app_version}

LABEL app.name="Trimmomatic v${app_version}" \
      app.desc="Trimmomatic: A flexible read trimming tool for Illumina NGS data" \
      app.site="http://www.usadellab.org/cms/?page=trimmomatic" \
      maintainer="B. Leopold, benjamin.leopold@jax.org"

WORKDIR /opt
ENV PATH "/opt/${app_path}:/usr/lib/jvm/java-11-openjdk/bin:$PATH"
RUN apk update && \
    apk add --no-cache \
        openjdk11-jdk \
        curl

ENV app_url=http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic \
    app_file=${app_path}.zip \
    app_jar=/opt/${app_path}/${app_name}-${app_version}.jar

RUN curl -L ${app_url}/${app_file} | jar xv

RUN echo -e \
    "#!/bin/sh\njava -Xmx4096m -jar ${app_jar} "'$@' \
    > /usr/bin/${app_name} && \
    chmod +x /usr/bin/${app_name}

ENTRYPOINT ["trimmomatic"]
CMD ["-version"]
