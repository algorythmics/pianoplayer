#!/bin/sh
cd $(dirname $0)

needed_libs="pde pdpp"

base_path=algorythmics/


# use github synthax
base_url=https://github.com/
base_git=git@github.com:

for lib in $needed_libs
do
    if  [ ! -d $lib  ]; then
        echo git checkout $lib
        git clone $base_git$base_path$lib.git
        if [ $? -ne 0 ]; then
            git clone $base_url$base_path$lib.git
        fi
    else
        git -C $lib pull
    fi
done
