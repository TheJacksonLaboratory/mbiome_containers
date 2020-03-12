FROM alpine:latest

ENV app_name bmtagger
ARG app_version=3.101
ARG blast_ver=2.10.0
ENV app_path ${app_name}

LABEL app.name="bmtagger v${app_version}" \
      app.desc="Best Match Tagger (BMTagger) is an efficient tool that \
                discriminates between human and microbial reads \
                without doing an alignment of reads to the human genome. \
                Note: This container by default uses ncbi-blast+ version ${blast_ver}." \
      maintainer="B. Leopold, benjamin.leopold@jax.org"

WORKDIR /opt/${app_path}
ENV PATH="/opt/${app_path}:$PATH"
RUN apk update && \
    apk add --no-cache \
        tar \
        curl \
        bash

ENV ncbi_url="https://ftp.ncbi.nlm.nih.gov"
ENV bmtagger_url="${ncbi_url}/pub/agarwala/bmtagger"
ENV blast_url="${ncbi_url}/blast/executables/blast+/${blast_ver}"
ENV blast_tar="ncbi-blast-${blast_ver}+-x64-linux.tar.gz"
ENV blast_dir="ncbi-blast-${blast_ver}+"
ENV PATH="/opt/${blast_dir}/bin:$PATH"

# get bmtagger bins
RUN for F in bmtagger.sh bmfilter bmtool srprism extract_fullseq ; do \
      curl -O ${bmtagger_url}/${F} ; \
    done && \
    chmod +x *

# install specified blast+ version
WORKDIR /opt
RUN curl -O ${blast_url}/${blast_tar} && \
    tar xzvf ${blast_tar} && \
    rm -rf ${blast_tar} && \
    unset ncbi_url bmtagger_url blast_url blast_tar blast_dir

ENTRYPOINT ["bmtagger.sh"]
CMD ["--help"]

# TODO: download (latest?) versions of human and mouse genomes
# TODO: RUN bmtool to format fasta files --OR-- require those files in the executing host instead of within this container.
# TODO: convert bmtagger.sh to work on single end fasta's --OR-- pass bmopts to specify that??
# TODO: CMD ["default bmtagger args?"]

# URL human genome:  ftp://ftp.ncbi.nlm.nih.gov/refseq/H_sapiens/annotation/GRCh38_latest/refseq_identifiers/GRCh38_latest_genomic.fna.gz

