#!/usr/bin/bash

scriptdir=$(readlink -f "$(dirname $(readlink -f $0))")
proj_root=$(readlink -f "$scriptdir/../../")
lsn_root=$(readlink -f "$proj_root/..")
source "$scriptdir/functions"
cd $proj_root

unified_out_dir="$proj_root/out"
echo "Unified out dir: $unified_out_dir"
#mkdir -v -p "$unified_out_dir"

for dir in $(find "$lsn_root/" -maxdepth 1 -name 'lsn-*'); do
  out_dir="$dir/out"
  if [ "$out_dir" != "$unified_out_dir" ]; then
    if [ -d "$out_dir" ]; then
      if (ask_yn "Remove directory: $out_dir"); then
        rm -r "$out_dir"
      fi
    elif [ -h "$out_dir" ]; then
      if (ask_yn "Unlink: $out_dir"); then
        unlink "$out_dir"
      fi
    fi
    if [[ ! -e "$out_dir" && ! -h "$out_dir" ]]; then
      echo "Create link: $out_dir"
      ln -s "$unified_out_dir" "$out_dir"
    fi
  fi
done
