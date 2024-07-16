#!/bin/bash

find -type f -name '*.php' | while read file; do
  release_file=$(echo "$file" | sed -e 's/\.php$/.html/')
  currentdir=$(pwd)
  mkdir -p "$(dirname "$release_file")" && \
  (cd "$(dirname "$file")" && php -f "$(basename "$file")" > "$currentdir/$(dirname "$release_file")/$(basename "$release_file")")
done
