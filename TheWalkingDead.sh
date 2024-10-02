#!/bin/bash
set -euo pipefail
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd "$DIR"

REMOVE_EXTENSION_REGEX='s/\.[^.]*$//'


IN="$1"
OUT=$(echo "$IN" | sed $REMOVE_EXTENSION_REGEX).pdf

ebook-convert "$IN" "$OUT" \
    --dont-grayscale \
    --custom-size 1620x2160 \
    --unit devicepixel \
    --output-profile generic_eink_hd

# dont-grayscale: Don't convert colors to greyscale (by default it converts, not sure why)
# custom-size: Custom size is for RMPP (double check values)
# unit: No idea what is the default
# output-profile: Not clear why without this the output is all pixelated, I'd think custom-size would be enough ... but no

cd - >/dev/null
