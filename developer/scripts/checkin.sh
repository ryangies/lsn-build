#!/bin/bash

root="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
source "$root/scripts/functions"
cd $root

./scripts/mkjs.sh -debug -force
svn ci $@
