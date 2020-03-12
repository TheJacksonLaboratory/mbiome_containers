FROM alpine:latest

ENV app_name bmtagger
ENV app_path ${app_name}
ENV bmtag_ver 3.101-SE

ARG blast_ver=2.10.0
ARG seqtk_ver=v1.3
ARG fastx_ver=0.0.13

LABEL app.name="bmtagger v${bmtag_ver}" \
      app.desc="Best Match Tagger (BMTagger) is an efficient tool that \
                discriminates between human and microbial reads \
                without doing an alignment of reads to the human genome. \
                Note: This container by default uses ncbi-blast+ version ${blast_ver}." \
      maintainer="B. Leopold, benjamin.leopold@jax.org"

WORKDIR /usr/local
ENV PATH="/usr/local/${app_path}:$PATH"
RUN apk update && \
    apk add --no-cache \
        bash     \
        tar      \
        curl     \
        bzip2    \
        git      \
    --virtual builders \
        gcc      \
        libc-dev \
        zlib-dev \
        make

ENV ncbi_url="https://ftp.ncbi.nlm.nih.gov"
ENV bmtagger_url="${ncbi_url}/pub/agarwala/bmtagger"
ENV blast_url="${ncbi_url}/blast/executables/blast+/${blast_ver}"
ENV blast_tar="ncbi-blast-${blast_ver}+-x64-linux.tar.gz"
ENV blast_dir="ncbi-blast-${blast_ver}+"
ENV PATH="/usr/local/${blast_dir}/bin:$PATH"

# get bmtagger bins
RUN for F in bmtagger.sh bmfilter bmtool srprism extract_fullseq ; do \
      curl -O ${bmtagger_url}/${F}; mv $F bin/; \
    done && \
    chmod +x bin/*

# install specified blast+ version
RUN curl -O ${blast_url}/${blast_tar} \
    && tar xzvf ${blast_tar} \
    && rm -rf ${blast_tar}
ENV PATH="/usr/local/${blast_dir}/bin:$PATH"

ENV fastx_url="http://hannonlab.cshl.edu/fastx_toolkit/"
ENV fastx_tar="fastx_toolkit_${fastx_ver}_binaries_Linux_2.6_amd64.tar.bz2"
RUN curl -O ${fastx_url}/${fastx_tar} \
    && tar xjvf ${fastx_tar} \
    && rm -f ${fastx_tar}

ENV seqtk_url="https://github.com/lh3/seqtk.git"
RUN git clone ${seqtk_url} \
    && cd seqtk \
    && git checkout -q ${seqtk_ver} \
    && make; \
    mv seqtk /usr/local/bin
    #&& apk del builders

COPY bmtagger_se.sh /usr/local/bin
RUN chmod +x /usr/local/bin/bmtagger_se.sh

ENTRYPOINT ["bmtagger_se.sh"]
CMD ["--help"]

# TODO: download (latest?) versions of human and mouse genomes
# TODO: RUN bmtool to format fasta files --OR-- require those files in the executing host instead of within this container.

# URL human genome:  ftp://ftp.ncbi.nlm.nih.gov/refseq/H_sapiens/annotation/GRCh38_latest/refseq_identifiers/GRCh38_latest_genomic.fna.gz

