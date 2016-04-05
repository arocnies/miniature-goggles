#!/usr/bin/env bash

dpkg-deb --build miniature-goggles_0.5
dpkg -i miniature-goggles_0.5.deb