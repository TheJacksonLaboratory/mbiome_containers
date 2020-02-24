#!/usr/bin/env bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Source Util Functions ~~~~~ #{{{
MbcLocalPath=/projects/mbiomecore/local
MBContainCons="${MbcLocalPath}/containers/singular"  # holds all singularity files
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #}}}

print() { printf '%b\n' "$@"; }
die() { print "$*" >&2 && exit 11; }

### 'sing' function used to run command from singularity container
sing_exec( ){
  local USAGE="Usage: sing_exec <container_name> <command [command2...]>"
  (command -v singularity 2>&1 >/dev/null) || module load singularity
  [[ "$#" -gt 1 ]] || die $USAGE
  #local con1="${1?'usage: sing <container_name> <command [commands]>'}" && shift
  local con1="${1}" && shift
  local cmds="${@}"
  local cont="$con1"
  [ "${cont##*.}" = "sif" ] || cont="${cont}.sif"
  [ -f "$cont" ] || cont="${MBContainCons}/${cont}"
  [ -f "$cont" ] || die "Container file '$cont' file not found!"
  singularity exec --cleanenv $cont $cmds
}
#sing_exec $*
