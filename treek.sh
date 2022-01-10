#!/bin/bash
# install tree
# install inotifytools

notify="inotifywait @./node_modules -r -e close_write -e access -e delete . &> /dev/null"

clear
cmd="tree --noreport -I node_modules -L 3 ."
$cmd

while eval "$notify"; do
    clear
    $cmd
done
