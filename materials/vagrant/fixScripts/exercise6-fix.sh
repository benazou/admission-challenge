#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Not enough arguments! min 2 required"
    exit 1
else
    current_srv=$(hostname)
    copy_dest=${@: -1}

    if [ "$current_srv" = server1 ]; then
        for copy_src in "${@:1:$#-1}"
        do
            scp "$copy_src" "server2:$copy_dest"
        done
    else
        for src_path in "${@:1:$#-1}"
        do
            scp "$copy_src" "server1:$copy_dest"
        done
    fi
fi
size=$( du -bc "${@:1:$#-1}" | tail -n1 | cut -f1)
echo $size