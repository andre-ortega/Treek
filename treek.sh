#!/bin/bash
# install tree
# install inotifytools

notify="inotifywait -r -e close_write -e access -e delete . &> /dev/null"

clear
cmd="tree -I node_modules -L 3 ."
$cmd


while eval "$notify"; do
    clear
    $cmd
done