#!/bin/bash

# Shamelessly copied from https://gist.github.com/zephraph/9169b9de4568b858f4b0e45fc41218b7
# Updated to run through shellcheck
DAYS_SINCE_LAST_CHANGE=45
SEARCH_PATH="$HOME/dev"
TOTAL_BYTES_REMOVED=0

Mb=1000000
Kb=1000

node_modules=$(find "$SEARCH_PATH" -name "node_modules" -type d -prune)

HAS_RECENTLY_CHANGED_FILES=false

check_for_changed_files () {
  local files=$(find "$1" -ctime -$DAYS_SINCE_LAST_CHANGE -not -path "**/.git/**" -not -path "**/node_modules/**")

  if [ -z "$files" ]; then
    HAS_RECENTLY_CHANGED_FILES=false
  else
    HAS_RECENTLY_CHANGED_FILES=true
  fi
}

for path in $node_modules
do
  parent_path=$(dirname "$path")

  check_for_changed_files "$parent_path"

  if [ "$HAS_RECENTLY_CHANGED_FILES" = false ]; then
    echo "Cleaning $path"
    removed=$(du -sh "$path" | cut -f1)
    rm -rf "$path"

    if [[ $removed == *"M" ]]; then
      TOTAL_BYTES_REMOVED=$(echo "$TOTAL_BYTES_REMOVED + (${removed/M/} * $Mb)" | bc)
    fi

    if [[ $removed == *"K" ]]; then
      TOTAL_BYTES_REMOVED=$(echo "$TOTAL_BYTES_REMOVED + (${removed/K/} * $Kb)" | bc)
    fi

    if [[ $removed == *"B" ]]; then
      TOTAL_BYTES_REMOVED=$(echo "$TOTAL_BYTES_REMOVED + ${removed/B/}" | bc)
    fi
  fi

done

if (( $(echo "$TOTAL_BYTES_REMOVED > $Mb" | bc -l) )); then
  formatted_bytes="$(echo "$TOTAL_BYTES_REMOVED / $Mb" | bc)M"
elif (( $(echo "$TOTAL_BYTES_REMOVED > $Kb" | bc -l) )); then
  formatted_bytes="$(echo "$TOTAL_BYTES_REMOVED / $Kb" | bc)K"
else
  formatted_bytes="${TOTAL_BYTES_REMOVED}B"
fi

echo "Bytes removed: $formatted_bytes"