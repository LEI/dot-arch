#!/bin/bash

set -e

if hash yaourt 2>/dev/null; then
  return
fi

TMPDIR=$(mktemp -d)
cd "$TMPDIR"
git clone --quiet https://aur.archlinux.org/package-query.git
makepkg --help
(cd package-query && makepkg --syncdeps --install --noprogressbar)
git clone --quiet https://aur.archlinux.org/yaourt.git
(cd yaourt && makepkg --syncdeps --install --noprogressbar)
ls -la "$TMPDIR"
