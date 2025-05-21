#!/bin/sh






# Symlink distrobox shims
[ ! -e /usr/bin/sh ] && ln -fs /bin/sh /usr/bin/sh
ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker
ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak
ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman
ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree
ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/transactional-update

# Update the container and install packages
dnf update -y
grep -v '^#' ./fedora-example.packages | xargs dnf install -y 
dnf clean all