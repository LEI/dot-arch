#!/bin/bash

set -e

if hash yaourt 2>/dev/null; then
  return
fi

TMPDIR=$(mktemp -d)
cd TMPDIR
git clone https://aur.archlinux.org/package-query.git
(cd package-query && makepkg -si)
git clone https://aur.archlinux.org/yaourt.git
(cd yaourt && makepkg -si)
echo "rm $TMPDIR"
