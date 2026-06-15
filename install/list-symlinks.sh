#!/usr/bin/env bash

find ~ -maxdepth 5 -type l 2>/dev/null | while read -r link; do
  target=$(readlink "$link")
  if [[ "$target" != /* ]]; then
    dir=$(dirname "$link")
    target=$(cd "$dir" && realpath -m "$target" 2>/dev/null || echo "$dir/$target")
  fi
  if [[ "$target" == *"/dotfiles"* ]]; then
    echo "$link -> $target"
  fi
done
