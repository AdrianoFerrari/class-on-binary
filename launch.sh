#!/usr/bin/env bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
google-chrome --app="file://$DIR/index.html" &>/dev/null &
disown
