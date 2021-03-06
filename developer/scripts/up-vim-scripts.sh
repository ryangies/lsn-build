#!/bin/bash

scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
root="$( cd "$scriptdir/../../" && pwd )"
source "$scriptdir/functions"
cd $root

dir_proj="/home/ryan/.vim"
dir_dest="$root/developer/vim"

folders=(
  syntax
)

files=(
  filetype.vim
  scripts.vim
  syntax/hf.vim
  syntax/hub+css.vim
  syntax/hub+html.vim
  syntax/hub+javascript.vim
  syntax/hubparse.vim
)

mkdir -v -p "$dir_dest"

for dir in ${folders[@]}; do
  mkdir -v -p "$dir_dest/$dir"
done

for path in ${files[@]}; do
  cp -v "$dir_proj/$path" "$dir_dest/$path"
done
