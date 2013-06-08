#!/bin/bash

scriptdir=$(readlink -f "$(dirname $(readlink -f $0))")
proj_root=$(readlink -f "$scriptdir/../../")
lsn_root=$(readlink -f "$proj_root/..")
source "$scriptdir/functions"
cd $lsn_root

projects=(
  lsn-data-hub
  lsn-www-hub
  lsn-lime
)

for proj in ${projects[@]}; do
  cd "$lsn_root/$proj"
  lsn-build dist project.hf
done

#lsn-build dist lsn-data-hub/project.hf -bump
#lsn-build dist specs/run/livesite.hf -bump
#lsn-build upload specs/run/livesite.hf
