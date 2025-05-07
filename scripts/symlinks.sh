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

    # Copy .config folder files
    replace_.config $1 $2
}

replace_.config() {
        mkdir -p "$HOME/.config"
        config_files=$(find $1/$2/.config -type f)
        for file in $config_files; do
            rel_path=${file#$1/$2/.config/}
            dir_path=$(dirname "$HOME/.config/$rel_path")
            mkdir -p "$dir_path"
            mv -f "$HOME/.config/$rel_path" "$1/old/$rel_path-$(date +%s%N)" 2>/dev/null
            etrace "linking $file to $HOME/.config/$rel_path"
            if [[ "$OSTYPE" == "msys"* ]]; then
                target_path=$(windowsPath "$file")
                link_path=$(windowsPath "$HOME/.config/$rel_path")
                powershell -noprofile "New-Item -ItemType SymbolicLink -Path $link_path -Target $target_path -Force"
            else
                ln -s "$file" "$HOME/.config/$rel_path"
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
