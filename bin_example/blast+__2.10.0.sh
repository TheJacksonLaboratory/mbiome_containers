#!/usr/bin/env bash
  # wrapper "bin" file for singularity container
  sif="blast+__2.10.0__ncbi.sif"
  bin="blast+__2.10.0.sh"
  cmds=( blastn blastp blastx makeblastdb makeprofiledb )

  #### Use via ln wrappers, e.g. within $wrapper_cmds list
  if [[ "$(basename $0)" =~ "$bin" ]]; then
    printf "%s needs a wrapper script e.g. %s\n" \
            $bin "${cmds[0]}${cmds[1]:+, ${cmds[1]}}"
  else
    { init="/projects/mbiomecore/local/etc/init" \
      && . ${init}/sing_exec.sh; } \
    && sing_exec ${sif} $(basename $0) $*;
  fi
