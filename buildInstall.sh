#!/usr/bin/env bash
version="0.5"

# Build man page
ronn goggles.1.ronn
mv goggles.1 miniature-goggles_$version/usr/local/share/man/man1/

# Build and install .deb
dpkg-deb --build miniature-goggles_0.5
dpkg -i miniature-goggles_0.5.deb