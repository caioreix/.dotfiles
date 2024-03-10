#!/bin/bash

replace() {
    files=$(find $1/$2 -maxdepth 1 -type f -name ".*")
    for file in $files; do
        name=$(basename $file)
        mv -f "$HOME/$name" "$1/old/$name-$(date +%s%N)"
        etrace "linking $1/$2/$name to $HOME/$name"
        if [[ "$OSTYPE" == "msys"* ]]; then
        echo ok
            powershell -noprofile "New-Item -ItemType SymbolicLink -Path $(windowsPath "$HOME/$name") -Target $(windowsPath "$1/$2/$name") -Force"
        else
            ln -s $1/$2/$name $HOME/$name
        fi
    done
}

windowsPath() {
    echo $1 | sed -e 's/^\///' -e 's/\//\\/g' -e 's/^./\0:/'
}

rsource() {
    files=$(find $1/$2 -maxdepth 1 -type f -name ".*")
    for file in $files; do
        name=$(basename $file)
        source $1/$2/$name
    done
}
