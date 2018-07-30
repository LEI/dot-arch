#!/bin/bash

set -e

if hash yaourt 2>/dev/null; then
  return
fi

TMPDIR=$(mktemp -d)
cd "$TMPDIR"
git clone --quiet https://aur.archlinux.org/package-query.git
makepkg --help
(cd package-query && makepkg -si)
git clone --quiet https://aur.archlinux.org/yaourt.git
(cd yaourt && makepkg -si)
echo "rm $TMPDIR"
