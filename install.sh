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

makepkg --help
exit 1

sudo pacman -Syu --noconfirm yajl

git clone --quiet https://aur.archlinux.org/package-query.git
(cd package-query && _makepkg)

git clone --quiet https://aur.archlinux.org/yaourt.git
(cd yaourt && _makepkg)

ls -la "$TMPDIR"
