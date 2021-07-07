#!/bin/bash

# https://github.com/containers/toolbox

echo " ----> Clone source code from repository"
git clone --depth 1 --branch "0.0.99.2" "https://github.com/containers/toolbox.git" /build/source

echo " ----> Change into source code directory"
cd /build/source

echo " ----> Generate configuration"
meson -Dprofile_dir=/etc/profile.d builddir

echo " ----> Build toolbox"
ninja -C builddir