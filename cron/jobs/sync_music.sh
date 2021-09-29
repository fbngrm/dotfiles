#!/usr/bin/env bash

set -e

synced_dir=0O0O0O
src=/data/sync/Dropbox/${synced_dir}/
dst=/data/sync/music/new/steven/

if [ -d "$src" ]; then
  mkdir -p "$dst"
  before="$(ls -R $dst | md5sum)"
  rsync -aWv --ignore-existing "$src" "$dst"
  after="$(ls -R $dst | md5sum)"
  if [ "$before" != "$after" ];
  then
    echo "diff"
    notify-send "Sync" "Steven dropped music into \"${synced_dir}\". Synced to \"${dst}\""
  fi
fi
