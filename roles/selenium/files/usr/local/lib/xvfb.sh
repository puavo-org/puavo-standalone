#!/bin/sh

# Driver script for Xvfb, launched by xvfb.service
# Converted from the old upstart script

env DISPLAY=:99
exec Xvfb :99 -screen 0 1920x1080x24
