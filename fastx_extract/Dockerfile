FROM biowardrobe2/fastx_toolkit:v0.0.14

LABEL app.name="fastq_to_fasta and extractreads_byname_fq.pl" \
      app.desc="From the FASTX-Toolkit, plus extractreads_byname_fq.pl" \
      maintainer="B. Leopold, benjamin.leopold@jax.org"

COPY extractreads_byname_fq.pl /usr/local/bin

ENTRYPOINT ["fastq_to_fasta"]
CMD ["--help"]
