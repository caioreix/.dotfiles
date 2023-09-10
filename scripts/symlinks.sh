replace() {
    files=$(find $1/$2 -maxdepth 1 -type f -name ".*" ! -name "*.bak")
    for file in $files; do
        name=$(basename $file)
        mv -f "$HOME/$name" "$1/old/$name-$(date +%s%N)"
        ln -s $1/$2/$name $HOME/$name

        if [ "$name" = ".zshrc" ]; then
            if ! grep -q "DOTFILES=" "$HOME/$name"; then
                echo "\nDOTFILES='$1'\n" >>"$HOME/$name"
            else
                sed -i'.bak' -e "s|DOTFILES=.*|DOTFILES='$1'|" "$1/$2/$name"
            fi
        fi
    done
}

rsource() {
    files=$(find $1/$2 -maxdepth 1 -type f -name ".*" ! -name "*.bak")
    for file in $files; do
        name=$(basename $file)
        source $1/$2/$name
    done
}
