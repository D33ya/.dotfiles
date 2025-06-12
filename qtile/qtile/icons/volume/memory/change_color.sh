#!/usr/bin/env bash

search_dir=/home/d33ya/.config/qtile/icons/volume/memory
wal_colors=/home/d33ya/.cache/wal/colors

IFS=$'\n' read -d "" -ra colors < "${wal_colors}"

for entry in "$search_dir"/*
do
    if [[ "${entry##*/}" != "${0##*/}" ]]; then
        magick $entry -fill "${colors[1]}" -colorize 100 $entry
    fi
done

# qtile cmd-obj -o cmd -f restart
