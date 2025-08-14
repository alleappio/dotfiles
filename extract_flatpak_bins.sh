#!/bin/bash

extract_flatpak_name() {
    local path="$1"
    local id
    id=$(basename "$path")
    echo "$id" | awk -F '.' '{print $(NF-1)}'
}

flatpak_bin=$(ls /var/lib/flatpak/app/*/current/*/export/bin/*)
for old_path in $flatpak_bin; do
  echo $old_path
  base_name=$(extract_flatpak_name $old_path)
  new_path="/usr/local/bin/$base_name"
  sudo ln -s $old_path $new_path
  echo "--------------"
done
