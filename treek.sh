#!/bin/bash
# install tree
# install inotifytools

notify="inotifywait @./node_modules -r -e close_write -e access -e delete . &> /dev/null"
cmd="tree -C -a --noreport \
    -I node_modules \
    -I __pycache__ \
    -I .git \
    -I .gitignore \
    -I *.png \
    -L 3 ."

function run {
	clear
    printf '\033[1;30m'
    echo "  -= Treek =-"
    printf '\033[0m'
	$cmd
}

run

while eval "$notify"; do
    run
done
