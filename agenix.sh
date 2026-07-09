#!/bin/sh
KEY_PATH="$(dirname "$0")/secret.key"

if [ ! -f "$KEY_PATH" ]; then
    echo "Cannot find secret.key: $KEY_PATH" >&2
    exit 1
fi

agenix -i "$KEY_PATH" "$@"