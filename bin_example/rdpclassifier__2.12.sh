#!/usr/bin/env bash
  # wrapper "bin" file for singularity container
  sif="rdpclassifier__2.12__cometsong.sif"
  bin="rdpclassifier__2.12.sh"
  cmds=( rdpclassifier )

  #### Use via ln wrappers, e.g. within $wrapper_cmds list
  if [[ "$(basename $0)" =~ "$bin" ]]; then
    printf "%s needs a wrapper script e.g. %s\n" \
            $bin "${cmds[0]}${cmds[1]:+, ${cmds[1]}}"
  else
    { init="/projects/mbiomecore/local/etc/init" \
      && . ${init}/sing_exec.sh; } \
    && sing_exec ${sif} $(basename $0) $*;
  fi
