# wrapper file for: ncbi-blast-plus__v2.8.1__biocontainers.sif
#### Use via wrappers of this, e.g. 'ncbi-blast-plus__v2.8.1.sh blastn' OR  'ncbi-blast-plus__v2.8.1.sh blastp' etc...
bin=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P) && source ${bin}/sing_exec.sh
[[ "$(basename $0)" =~ "ncbi" ]] \
&& err 'ncbi-blast+ needs a wrapper script e.g. blastn or makeblastdb' \
|| sing_exec ncbi-blast-plus__v2.8.1__biocontainers.sif $(basename $0) $*
