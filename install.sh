#!/bin/bash

set -e

if hash yaourt 2>/dev/null; then
  return
fi

_makepkg() {
  makepkg --syncdeps --install --noprogressbar
}

TMPDIR=$(mktemp -d)

cd "$TMPDIR"

git clone --quiet https://aur.archlinux.org/package-query.git
pacman -Syu --noconfirm yajl
(cd package-query && _makepkg)

git clone --quiet https://aur.archlinux.org/yaourt.git
(cd yaourt && _makepkg)

ls -la "$TMPDIR"
