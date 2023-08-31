replace(){
    files=$(find $1/$2 -maxdepth 1 -type f -name ".*")
    for file in $files; do
        name=$(basename $file)
        mv -f "$HOME/$name" "$1/old/$name-$(date +%s%N)"
        ln -s $1/$2/$name $HOME/$name
        source $HOME/$name
    done
}

rsource(){
    files=$(find $1/$2 -maxdepth 1 -type f -name ".*")
    for file in $files; do
        name=$(basename $file)
        source $1/$2/$name
    done
}
