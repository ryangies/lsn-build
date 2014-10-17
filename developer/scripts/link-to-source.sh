#!/bin/bash

if [ ! -d "${LSN_SRC_ROOT}" ]; then
  echo "LSN_SRC_ROOT does not resolve to a directory, exiting"
  exit 1
fi

libdir='/usr/lib/livesite'
sharedir='/usr/share/livesite'

libsrc=(
  "${LSN_SRC_ROOT}/lsn-data-hub/src/lib"
  "${LSN_SRC_ROOT}/lsn-www-hub/src/lib"
)

sharesrc=(
  "${LSN_SRC_ROOT}/lsn-www-hub/src/share/server"
  "${LSN_SRC_ROOT}/lsn-www-hub/src/share/web"
  "${LSN_SRC_ROOT}/lsn-lime/src/share/web"
)

function _link_subdirs () {
  local dir="$1"
  for x in $(ls "$dir"); do
    if [ ! -e "$x" ]; then
      ln -s "$dir/$x" "$x"
    fi
  done
}

function _link_dir () {
  local dir="$1"
  local subdir="$(basename $1)"
  [ ! -d "$subdir" ] && mkdir "$subdir"
  for x in $(ls "$dir"); do
    if [ ! -e "$subdir/$x" ]; then
      ln -s "$dir/$x" "$subdir/$x"
    fi
  done
}

mkdir -p $libdir
cd $libdir
if [ "$(pwd)" == "$libdir" ]; then
  for i in `ls`; do unlink $i; done
  for dir in ${libsrc[@]}; do
    _link_subdirs "$dir"
  done
fi

mkdir -p $sharedir
cd $sharedir
if [ "$(pwd)" == "$sharedir" ]; then
  for dir in ${sharesrc[@]}; do
    _link_dir "$dir"
  done
fi
