#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q PACKAGENAME | awk '{print $2; exit}') # example command to get version of application here
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/pixmaps/stm32cubemx.png
export DESKTOP=https://aur.archlinux.org/cgit/aur.git/plain/stm32cubemx.desktop?h=stm32cubemx

# Deploy dependencies
quick-sharun stm32cubemx

# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage
