#!/usr/bin/env bash

while IFS=, read source path
do
    if [ -d "$path" ]; then
        cd $path
        git pull
    else
        git clone $source $path
        cd $path
        git config core.sparsecheckout true
        echo docs/ > .git/info/sparse-checkout
        git read-tree -m -u HEAD
    fi
done < externals.txt
