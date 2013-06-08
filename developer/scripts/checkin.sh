#!/bin/bash

root=$(readlink -f "$(dirname $(readlink -f $0))/../")
source "$root/scripts/functions"
cd $root

./scripts/mkjs.sh -debug -force
svn ci $@
