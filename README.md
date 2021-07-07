# Toolbox Build Ubuntu

## Description

Simple Containerfile and shell script for building [Toolbox](https://github.com/containers/toolbox) from source for Ubuntu Hirsute Hippo.

## Usage

``` shell
git clone https://github.com/mbaezner/build-toolbox-ubuntu.git
cd build-toolbox-ubuntu
podman build --tag toolbox-build-ubuntu .
podman run --rm -it -v "$(pwd)":/build localhost/toolbox-build-ubuntu /build/build.sh
sudo mv source/completion/bash/toolbox /usr/share/bash-completion/completions
sudo mv source/profile.d/toolbox.sh /etc/profile.d
sudo mv source/builddir/doc/* /usr/local/share/man/man1
sudo mv source/builddir/src/toolbox /usr/local/bin
```
